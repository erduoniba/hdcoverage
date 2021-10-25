# 引入库
require 'xcodeproj'

#打开项目工程.xcodeproj
project_path = ARGV[0]
puts 'project_path is %s' % project_path
project = Xcodeproj::Project.open(project_path)

# 查询有多少个target
project.targets.each do |target|
    puts target.name
end

puts "===="
puts project.targets[0]

# 遍历配置
project.targets.each do |target|
    target.build_configurations.each do |config|
        #获得build settings
    build_settings = config.build_settings
    #build_settings是一个哈希，里面是一个个配置
    build_settings["OTHER_SWIFT_FLAGS"] = "-profile-generate -profile-coverage-mapping"
    end
end

project.save
