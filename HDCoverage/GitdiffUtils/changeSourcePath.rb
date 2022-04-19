require_relative 'trollop'

module GitUtils
    def changeSourcesPath(coverage_info_file, build_source_path, local_source_path)
        coverage_info_path = File.dirname(coverage_info_file)

        puts "======"
        puts "coverage_info_file: #{coverage_info_file}"
        puts "build_source_path: #{build_source_path}"
        puts "local_source_path: #{local_source_path}"
        # puts file_map
        puts "======"

        # r:utf-8表示以utf-8编码读取文件，要与当前代码文件的编码相同
        File.open(coverage_info_file,"r:utf-8") do |lines| 
            #将文件中所有的ostr替换为nstr，并将替换后文件内容赋值给buffer
            puts "lines : #{lines}"
            buffer = lines.read.gsub(build_source_path, local_source_path) 
            #以写的方式打开文件，将buffer覆盖写入文件
            File.open(coverage_info_file,"w"){|l| 
                l.write(buffer)
            }
        end
    end
end

if __FILE__ == $0
    include GitUtils
    
    opts = Trollop::options do
        opt :build_source_path, 'Path for build source', :type => :string
        opt :local_source_path, 'Path for local source', :type => :string
        opt :coverage_info_file, 'Path for covage info file', :type => :string
    end

    Trollop::die :build_source_path, 'must be provided' if opts[:build_source_path].nil?
    Trollop::die :local_source_path, 'must be provided' if opts[:local_source_path].nil?
    Trollop::die :coverage_info_file, 'must be provided' if opts[:coverage_info_file].nil?
    GitUtils.changeSourcesPath(opts[:coverage_info_file], opts[:build_source_path], opts[:local_source_path])
end
