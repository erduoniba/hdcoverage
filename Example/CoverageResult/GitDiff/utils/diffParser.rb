require_relative '../trollop'

module GitUtil
    def white_adpator(line, white_list)
        # ⚠️ 使用该代码获取文件名，会在后面多一个换行符，这里需要剔除换行符
        extn = File.extname(line).delete!("\n")
        puts "extn: #{extn}"
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
                    puts "whiteFile is true"
                    puts ""
                    whiteFile = true
                    next
                else
                    puts "whiteFile is false"
                    puts ""
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
        puts file_map
        return file_map
    end

end

if __FILE__ == $0
    include GitUtil
    
    opts = Trollop::options do
        opt :diff_file, 'Path for diff file', :type => :string
    end

    Trollop::die :diff_file, 'must be provided' if opts[:diff_file].nil?

    white_list = ['.m', '.mm', '.swift']
    GitUtil.code_diff_map(opts[:diff_file], white_list)
end