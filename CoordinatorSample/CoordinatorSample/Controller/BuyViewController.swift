//
//  BuyViewController.swift
//  CoordinatorSample
//
//  Created by Dario on 7/9/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

final class BuyViewController: UIViewController, Storyboarded {

    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("selected prduct: \(selectedProduct)")
    }
}
