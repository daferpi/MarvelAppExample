# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
#

use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'

plugin 'cocoapods-keys', {
  project: 'MarvelAppExample',
  keys: [
    'privateApiKey',
    'publicApiKey'
  ]
}

target 'MarvelAppExample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  pod 'RxSwift'    
  pod 'RxCocoa'    
  pod 'Moya/RxSwift'

  # Pods for MarvelAppExample

  target 'MarvelAppExampleTests' do
    inherit! :search_paths
    pod 'RxBlocking' 
    pod 'RxTest'     
  end

  target 'MarvelAppExampleUITests' do
    inherit! :search_paths
    pod 'RxBlocking' 
    pod 'RxTest'     
  end

end
