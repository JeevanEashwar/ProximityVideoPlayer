# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def target_pods
  pod 'google-cast-sdk'
end

target 'ProximityVideoPlayer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ProximityVideoPlayer
  target_pods

  target 'ProximityVideoPlayerTests' do
    inherit! :search_paths
    # Pods for testing
    target_pods
  end

  target 'ProximityVideoPlayerUITests' do
    # Pods for testing
    target_pods
  end

end
