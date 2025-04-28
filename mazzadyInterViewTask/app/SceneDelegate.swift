import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userVC = storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        
        userVC.userDataViewModel = AppDIContainer.shared.makeUserViewModel()
        userVC.adsViewModel = AppDIContainer.shared.makeAdvertisementViewModel()
        userVC.tagsViewModel = AppDIContainer.shared.makeTagsViewModel()
        userVC.productsViewModel = AppDIContainer.shared.makeProductsViewModel()
        
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .white
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .white
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        
        let storeVC = UIViewController()
        storeVC.view.backgroundColor = .white
        storeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), tag: 2)
        
        let cartVC = UIViewController()
        cartVC.view.backgroundColor = .white
        cartVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "cart"), tag: 3)
        
        let userNavVC = UINavigationController(rootViewController: userVC)
        userNavVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 4)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, searchVC, storeVC, cartVC, userNavVC]
        
        let customTabBar = CustomTabBar()
        tabBarController.setValue(customTabBar, forKey: "tabBar")
        customTabBar.setupMiddleButton()
        
        customTabBar.tintColor = UIColor(red: 210/255, green: 6/255, blue: 83/255, alpha: 1.0)
        customTabBar.backgroundColor = .white
        
        customTabBar.layer.shadowColor = UIColor.black.cgColor
        customTabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        customTabBar.layer.shadowOpacity = 0.1
        customTabBar.layer.shadowRadius = 5
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("MiddleButtonTapped"),
                                               object: nil,
                                               queue: .main) { _ in
            tabBarController.selectedIndex = 2
        }
        tabBarController.selectedIndex = 4

        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
      
