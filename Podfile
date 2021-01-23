# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# ResightSDK repo
source 'https://gitlab.com/resight/cocoapods-specs.git'

# Public repo
source 'https://github.com/CocoaPods/Specs.git'

target 'kitchenaire' do
  use_frameworks!
  pod 'ResightSDK', '0.0.3'

end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.4'
    end
  end
end
