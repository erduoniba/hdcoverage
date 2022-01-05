require_relative '../trollop'

module GitUtil
    def white_adpator(line, white_list)
        if line.start_with? 'diff --git'
            extn = File.extname line
            puts "extname: #{extn}，white_list: #{white_list}"
            if white_list.include?(extn)
                return true
            end
        end
        return false
    end

    def code_diff_map(diff_file, white_list)
        file_map = {}
        current_file = nil

        File.open(diff_file).each do |line| 
            if white_adpator(line, white_list) == false
                puts "非制定白名单文件，废弃"
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