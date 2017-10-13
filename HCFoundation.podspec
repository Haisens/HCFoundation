#
# Be sure to run `pod lib lint HCFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HCFoundation'
  s.version          = '0.0.5'
  s.summary          = 'iOS基础拓展，简单易用，高效开发首选!'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS基础拓展（NSObject、NSData、NSString、NSData、UIColor、UIImage应有尽有），常用宏定义简单易用，高效开发首选！
                       DESC

  s.homepage         = 'https://github.com/Haisens/HCFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'haisens@163.com' => '殷海超' }
  s.source           = { :git => 'https://github.com/Haisens/HCFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

s.source_files = 'HCFoundation/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'HCFoundation' => ['HCFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
