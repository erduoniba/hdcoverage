#
# Be sure to run `pod lib lint HDCoverage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HDCoverage'
  s.version          = '0.1.0'
  s.summary          = 'Swift&OC Coverage Shell, Set Build-Settings and Copy MachO file, let work automatic'
  s.description      = <<-DESC
                      Swift&OC Coverage Shell, Set Build-Settings and Copy MachO file, let work automatic
                      0.1.0: add sh and ruby files
                       DESC

  s.homepage         = 'https://github.com/denglibing/HDCoverage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denglibing' => 'denglibing3@jd.com' }
  s.source           = { :git => 'https://github.com/denglibing/HDCoverage.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'HDCoverage/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HDCoverage' => ['HDCoverage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
