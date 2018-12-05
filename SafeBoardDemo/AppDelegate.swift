import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let rootController = FramesViewController()
        let rootController = ConstraintsDemoViewController()
        window?.rootViewController = rootController
        return true
    }

}

