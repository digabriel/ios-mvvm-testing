# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

def testing_pods
  pod 'Quick',     '~> 1.3'
  pod 'Nimble',    '~> 7.3'
end

target 'iOS-Sample' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iOS-Sample

  pod 'RxSwift',     '~> 4.0'
  pod 'RxCocoa',     '~> 4.0'
  pod 'RxAlamofire', '~> 4.3'

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
