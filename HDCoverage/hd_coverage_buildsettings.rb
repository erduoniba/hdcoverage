# 引入库
require 'xcodeproj'

#打开项目工程.xcodeproj
project_path = ARGV[0]
puts 'project_path is %s' % project_path
project = Xcodeproj::Project.open(project_path)

# 遍历配置
project.targets.each do |target|
    target.build_configurations.each do |config|
        #获得build settings
    build_settings = config.build_settings
    #build_settings是一个哈希，里面是一个个配置
    build_settings["OTHER_SWIFT_FLAGS"] = "-profile-generate -profile-coverage-mapping"
    build_settings["OTHER_CFLAGS"] = "-fprofile-instr-generate -fcoverage-mapping"
    build_settings["OTHER_LDFLAGS"] = "-fprofile-instr-generate"
    end
end

project.save
