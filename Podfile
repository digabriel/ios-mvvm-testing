# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def testing_pods
  pod 'Quick',     '2.1.0'
  pod 'Nimble',    '8.0.2'
end

target 'iOS-Sample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iOS-Sample

  pod 'RxSwift',     '5.0.0'
  pod 'RxCocoa',     '5.0.0'
  pod 'RxAlamofire', '5.0.0'

  target 'iOS-SampleTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'iOS-SampleUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
