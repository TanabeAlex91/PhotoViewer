source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

target 'PhotoViewer' do
  use_frameworks!

  pod 'Alamofire', '~> 4.0'
  pod 'AlamofireImage', '~> 3.1'
  pod 'AlamofireNetworkActivityIndicator', '~> 2.0'
  pod 'SwiftyJSON'
  pod 'PKHUD', '~> 4.0'
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
