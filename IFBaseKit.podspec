#
# Be sure to run `pod lib lint IFBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IFBaseKit'
  s.version          = '0.0.0.5'
  s.summary          = '相关 base'

  s.description      = <<-DESC
controller、navigation、refresh、collection、tableview、tabbar
                       DESC

  s.homepage         = 'https://ifgitlab.gwm.cn/iov-ios/IFBaseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '张高磊' => 'mrglzh@yeah.net' }
  s.source           = { :git => 'http://10.255.35.174/iov-ios/IFBaseKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'IFBaseKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IFBaseKit' => ['IFBaseKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'MJRefresh'
   s.dependency 'DZNEmptyDataSet'
   s.dependency 'Masonry'
#   s.dependency 'MJRefresh', '~> 3.0.0'
#   s.dependency 'DZNEmptyDataSet', '~> 1.8.0'
#   s.dependency 'Masonry', '~> 1.1.0'
end
