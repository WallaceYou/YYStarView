Pod::Spec.new do |s|
  s.name         = "YYStarView"
  s.version      = "1.0.1"
  s.summary      = "A simple and easy to use and powerful star rating or display framework"
  s.description  = "A simple and easy to use and powerful star rating or display framework with cocoapod support."
  s.homepage     = "https://github.com/WallaceYou/YYStarView"
  s.license      = 'MIT'
  s.author       = { "WallaceYou" => "youxiaooyu@163.com" }
  s.source       = { :git => "https://github.com/WallaceYou/YYStarView.git", :tag => s.version }
  s.source_files = "YYStarView/*.{h,m,png}"
  s.ios.deployment_target = '6.0'
  s.frameworks   = 'UIKit'
  s.requires_arc = true

end