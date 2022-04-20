require_relative 'trollop'

module GitUtils
    def deleteExtraData(coverage_info_file)
        coverage_info_file_path = File.dirname(coverage_info_file)
        coverage_correct_info_file_path = "coverage_info_correct.info"

        puts "======"
        puts "coverage_info_file_path: #{coverage_info_file_path}"
        puts "coverage_correct_info_file_path: #{coverage_correct_info_file_path}"
        puts "======"

        coverage_correct_info_file = File.new(coverage_correct_info_file_path, "w+")

        extraLine = false
        File.open(coverage_info_file).each do |line|
            # info包含 JD_vendored_libs 等数据为脏数据，需要移除
            if line.start_with? 'SF:'
                if line.include? "JD_vendored_libs"
                    extraLine = true
                    next
                else
                    puts "contain yes: #{line}"
                    extraLine = false
                end
            end

            if extraLine == false
                coverage_correct_info_file.syswrite(line)
            end
        end
    end
end

if __FILE__ == $0
    include GitUtils
    
    opts = Trollop::options do
        opt :coverage_info_file, 'Path for covage info file', :type => :string
    end

    GitUtils.deleteExtraData(opts[:coverage_info_file])
end
    