platform :ios, '9.0'

target 'Movies' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for sismob-ios
  pod 'ReSwift', '~> 3.0'
#  pod 'ReSwiftRouter', '~> 0.5'
#  pod 'ReSwiftRecorder', '~> 0.4'
#  pod 'Alamofire', '~> 4.4'
#  pod 'ObjectMapper', '~> 2.2'
#  pod 'CocoaLumberjack/Swift'
#  pod 'XLPagerTabStrip', '~> 7.0'
#  pod 'SWRevealViewController', '~> 2.3.0'
#  pod 'PromiseKit/Alamofire', '~> 4.0'
#  pod 'Fabric'
#  pod 'Crashlytics'
#  pod 'DLRadioButton', '~> 1.4'
#  pod 'ImagePicker'
#  pod 'IQKeyboardManagerSwift', '5.0.0'

#Correcao bug xcode8 + Realm
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end

target :MoviesTests do
  pod 'ReSwift', '~> 3.0'
end

end
