project_name = ARGV[0]
puts 'project_name is %s' % project_name

# 引入库
require 'xcodeproj'

#打开项目工程.xcodeproj
project_path = './%s.xcodeproj' % project_name
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
    build_settings.each do |key,value|
       build_settings["OTHER_SWIFT_FLAGS"] = "-profile-generate -profile-coverage-mapping"
    end
    end
end

project.save
