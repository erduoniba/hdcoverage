require 'json'
require_relative '../trollop'

module GitUtil
    def white_adpator(line, white_list)
        # 注意：使用该代码获取文件名，会在后面多一个换行符，这里需要剔除换行符
        extn = File.extname(line).delete!("\n")
        white_list.map { |item|
            if item == extn
                return true
            end
        }
        return false
    end

    def code_diff_map(diff_file, white_list)
        file_map = {}
        current_file = nil
        # 是否是白名单格式的文件
        whiteFile = false

        File.open(diff_file).each do |line| 
            # 新的文件改动标识
            if line.start_with? 'diff --git'
                # 判断是白名单格式的文件
                if white_adpator(line, white_list)
                    whiteFile = true
                    next
                else
                    whiteFile = false
                    next
                end
            end

            if whiteFile == false
                next
            end

            if line.start_with? '+++'
                # 提取文件路径
                file_path = line[/\/.*/, 0][1..-1]
                if file_path
                    current_file = file_path
                    file_map[current_file] = []
                end
            end

            if line.start_with? '@@'
                # 提取新增代码行，格式为 “+66,5”
                change = line[/\+.*?\s{1}/, 0]
                # 消除“+”
                change = change[1..-1]
                # flat
                if change.include? ','
                    base_line = change.split(',')[0].to_i
                    delta = change.split(',')[1].to_i
                    delta.times { |i| file_map[current_file].push(base_line + i) if current_file}
                else
                    file_map[current_file].push(change.to_i) if current_file
                end
            end
        end

        diff_file_path = File.dirname(diff_file)
        diff_file_name = File.basename(diff_file, ".*")
        diff_json_file_path = "#{diff_file_path}/#{diff_file_name}.json"
        diff_json_file = File.new(diff_json_file_path, "w+")
        diff_json_file.syswrite(file_map.to_json)

        return file_map
    end

    def gatherCoverageInfo(coverage_info_file, file_map)
        gather_file = false
        gather_file_lines = []
        coverage_info_path = File.dirname(coverage_info_file)
        coverage_file_name = File.basename(coverage_info_file, ".*")
        coverage_gather_file_path = "#{coverage_info_path}/#{coverage_file_name}_gather.info"
        puts "======"
        puts "coverage_info_path: #{coverage_info_path}"
        puts "coverage_info_file: #{coverage_info_file}"
        puts "coverage_gather_file_path: #{coverage_gather_file_path}"
        # puts file_map
        puts "======"
        coverage_gather_file = File.new(coverage_gather_file_path, "w+")
        File.open(coverage_info_file).each do |line| 
            # 代码覆盖率info的文件开头标识
            if line.start_with? 'SF:'
                # 获取文件名称，包含后缀
                gather_file = false
                basen = File.basename(line).delete!("\n")
                # puts "basen:#{basen}"
                file_map.each_key { |key|
                    if key.include?(basen)
                        gather_file = true
                        gather_file_lines = file_map[key]
                        coverage_gather_file.syswrite(line)
                        # puts "gather_file:#{gather_file}"
                        # puts "gather_file_lines:#{gather_file_lines}"
                        next
                    end
                }
            end

            if gather_file == false
                next
            end

            # 该类中的每一行信息的标识
            # DA:20,1
            if line.start_with? 'DA:'
                line_number = line.split("DA:")[1]
                real_line = line_number.split(",")[0].to_i
                # puts "gather_file_lines:#{gather_file_lines}"
                # puts "real_line: #{real_line}"
                if gather_file_lines.include?(real_line)
                    # puts "gather_line: #{line}"
                    coverage_gather_file.syswrite(line)
                end
            else
                coverage_gather_file.syswrite(line)
            end
        end

        return coverage_gather_file
    end

end

if __FILE__ == $0
    include GitUtil
    
    opts = Trollop::options do
        opt :diff_file, 'Path for diff file', :type => :string
        opt :coverage_info_file, 'Path for covage info file', :type => :string
    end

    Trollop::die :diff_file, 'must be provided' if opts[:diff_file].nil?
    Trollop::die :coverage_info_file, 'must be provided' if opts[:coverage_info_file].nil?

    white_list = ['.m', '.mm', '.swift']
    # 通过git diff获取简洁可用的增量信息 file_map
    file_map = GitUtil.code_diff_map(opts[:diff_file], white_list)
    # 结合file_map 和覆盖率文件，得到增量覆盖率文件
    coverage_gather_file = GitUtil.gatherCoverageInfo(opts[:coverage_info_file], file_map)
end