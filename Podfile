# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'


# Workspace
workspace 'Project-Famili'

def mainModule
  pod "Firebase/Auth", '~> 7.0.0'
  pod "Firebase/Analytics", '~> 7.0.0'
  pod "Firebase/Messaging", '~> 7.0.0'
  pod "Alamofire", '~> 5.3.0'
  pod "RxSwift", '~> 5.1.1'
  pod "RxCocoa", '~> 5.1.1'
  pod "GoogleSignIn", '~> 5.0.2'
  pod "FBSDKLoginKit", '~> 8.0.0'
end

def testModule
  pod "Quick", '~> 3.0.0'
  pod "Nimble", '~> 9.0.0'
end

# Target

target "LUMain" do
  project 'Laundron-User/LUMain/LUMain.project'
  use_frameworks!
  mainModule
    target 'LUMainTests' do
      inherit! :search_paths
      mainModule
      testModule
    end

# --- || Common || ---
# --- | Network | ---
  target 'LUNetwork' do
    project 'Laundron-User/LUNetwork/LUNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | Handler | ---
  target 'LUHandler' do
    project 'Laundron-User/LUHandler/LUHandler.project'
    inherit! :complete
    use_frameworks!
    mainModule
  end

# --- | Coordinator | ---
  target 'LUAppCoordinator' do
    project 'Laundron-User/LUCoordinatorHandler/LUAppCoordinator/LUAppCoordinator.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end


# --- || Feature || ---
# --- | LUSample | ---
  target 'LUSample' do
    project 'Laundron-User/LUFeature/LUSample/LUSample/LUSample.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUSampleTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUSampleNetwork' do
    project 'Laundron-User/LUFeature/LUSample/LUSampleNetwork/LUSampleNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | LUSplash | ---
   target 'LUSplash' do
    project 'Laundron-User/LUFeature/LUSplash/LUSplash/LUSplash.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUSplashTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUSplashNetwork' do
    project 'Laundron-User/LUFeature/LUSPlash/LUSplashNetwork/LUSplashNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | LUAuth | ---
   target 'LUAuth' do
    project 'Laundron-User/LUFeature/LUAuth/LUAuth/LUAuth.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUAuthTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUAuthNetwork' do
    project 'Laundron-User/LUFeature/LUAuth/LUAuthNetwork/LUAuthNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | LUHome | ---
   target 'LUHome' do
    project 'Laundron-User/LUFeature/LUHome/LUHome/LUHome.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUHomeTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUHomeNetwork' do
    project 'Laundron-User/LUFeature/LUHome/LUHomeNetwork/LUHomeNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | LUProfile | ---
   target 'LUProfile' do
    project 'Laundron-User/LUFeature/LUProfile/LUProfile/LUProfile.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUProfileTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUProfileNetwork' do
    project 'Laundron-User/LUFeature/LUProfile/LUProfileNetwork/LUProfileNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end

# --- | LUOrder | ---
   target 'LUOrder' do
    project 'Laundron-User/LUFeature/LUOrder/LUOrder/LUOrder.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
    target 'LUOrderTests' do
      inherit! :search_paths
      mainModule
      testModule
    end
  end

  target 'LUOrderNetwork' do
    project 'Laundron-User/LUFeature/LUOrder/LUOrderNetwork/LUOrderNetwork.project'
    inherit! :search_paths
    use_frameworks!
    mainModule
  end
end
