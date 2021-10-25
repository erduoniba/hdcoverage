#
# Be sure to run `pod lib lint HDCoverage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HDCoverage'
  s.version          = '1.0.6'
  s.summary          = 'Swift&OC Coverage Shell, Set Build-Settings and Copy MachO file, let work automatic'
  s.description      = <<-DESC
                      Swift&OC Coverage Shell, Set Build-Settings and Copy MachO file, let work automatic
                      0.1.0: add shells and ruby files
                      1.0.0: release
                      1.0.1: move files
                      1.0.2: perfect shells
                      1.0.3: optimize macho_copy.sh (auto open code coverage result folder)
                      1.0.4: optimize parse_profraw.sh (auto open code coverage result folder)
                      1.0.5: optimize hdcoverage_env.sh (auto get project_path)
                       DESC

  s.homepage         = 'https://github.com/erduoniba/hdcoverage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denglibing' => 'denglibing3@jd.com' }
  s.source           = { :git => 'https://github.com/erduoniba/hdcoverage.git', :tag => s.version.to_s }

  s.source_files = 'HDCoverage/**/*'
  
  # s.resource_bundles = {
  #   'HDCoverage' => ['HDCoverage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
