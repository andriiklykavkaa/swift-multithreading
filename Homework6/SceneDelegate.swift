//
//  SceneDelegate.swift
//  Homework6
//
//  Created by Andrii Klykavka on 29.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [
            createVC(type: .numberChecker, imageSystemName: "numbersign", title: "NumChecker"),
            createVC(type: .resourceRace, imageSystemName: "figure.run", title: "ResRace"),
            createVC(type: .imageFilter, imageSystemName: "photo", title: "ImageFilter"),
            createVC(type: .graphTravertsal, imageSystemName: "tree", title: "GraphTrav")
        ]
        UITabBar.appearance().tintColor = UIColor.systemBlue
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        window.rootViewController = tabBar
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func createVC(type: ControllerType, imageSystemName: String, title: String) -> UIViewController {
        let controller: UIViewController
        switch type {
        case .numberChecker:
            let numberCheckerService = NumberChecker()
            controller = NumberCheckerController(numberCheckerService: numberCheckerService)
        case .resourceRace:
            let bankAccount = BankAccount()
            controller = ResourceRaceController(bankAccount: bankAccount)
        case .imageFilter:
            controller = ImageFilterController()
        case .graphTravertsal:
            controller = GraphTraversalController()
        }
        controller.tabBarItem.title = title
        controller.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageSystemName), tag: type.rawValue)
        return controller
    }
    
    private enum ControllerType: Int {
        case numberChecker = 0
        case resourceRace
        case imageFilter
        case graphTravertsal
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
