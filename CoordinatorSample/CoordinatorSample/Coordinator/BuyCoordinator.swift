//
//  BuyCoordinator.swift
//  CoordinatorSample
//
//  Created by Dario on 7/9/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var selectedProduct = 0
    
    init(navigationController: UINavigationController, productToBuy: Int) {
        self.navigationController = navigationController
        self.selectedProduct = productToBuy
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = selectedProduct
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
