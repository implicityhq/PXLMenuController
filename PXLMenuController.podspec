Pod::Spec.new do |spec|
  spec.name = 'PXLMenuController'
  spec.version  = '1.0.0'
  spec.summary  = 'An easy way to present your users with a menu controller.'
  spec.homepage = 'https://github.com/jasonsilberman/PXLMenuController'
  spec.author = { 'Jason Silberman' => 'j@j99.co' }
  spec.source = { :git => 'https://github.com/jasonsilberman/PXLMenuController.git', :tag => "v#{spec.version}" }
  spec.requires_arc = true
  spec.license  = { :type => 'MIT', :file => 'LICENSE' }
  spec.frameworks = 'Foundation', 'UIKit'

  spec.platform = :ios, '7.0'
  spec.ios.deployment_target  = '7.0'

  spec.source_files = 'PXLMenuController/*.{h,m}'
end