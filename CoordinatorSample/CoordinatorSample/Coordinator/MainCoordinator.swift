//
//  MainCoordinator.swift
//  CoordinatorSample
//
//  Created by Dario on 7/9/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

final class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        navigationController.delegate = self
        
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func childDidFinish(_ child: Coordinator) {
        childCoordinators.removeAll { $0 === child }
    }
    
    
    func buySubscription(to productType: Int) {
        let buyCoordinator = BuyCoordinator(navigationController: self.navigationController, productToBuy: productType)
        buyCoordinator.parentCoordinator = self
        childCoordinators.append(buyCoordinator)

        buyCoordinator.start()
    }
    
    
    func createAccount() {
        let vc = CreateAccuntViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read which view controller we are moving from
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        // Check if the view controller array contains the affected view controller. If it does it means we are pushing another view controller instead of popping the affected view controller
        if navigationController.viewControllers.contains(fromVC) { return }
        
        // If we reach this point it meas we are popping fromVC so we can check if its a BuyViewController
        if let buyViewController = fromVC as? BuyViewController, let coordinator = buyViewController.coordinator {
            childDidFinish(coordinator)
        }
    }
}
