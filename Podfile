# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


# Workspace
workspace 'Project-Famili'

def mainModule
  pod "Firebase/Auth"
  pod "Firebase/Analytics"
  pod "Firebase/Messaging"
  pod "Alamofire"
  pod "RxSwift"
  pod "RxCocoa"
  pod "GoogleSignIn"
  pod "FBSDKLoginKit"
end

# Target
target 'MainApp' do
  project 'MainApp/MainApp.project'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MainApp
  mainModule
  target 'MainAppTests' do
    inherit! :search_paths
    # Pods for testing
    pod "Quick"
    pod "Nimble"
  end

end
