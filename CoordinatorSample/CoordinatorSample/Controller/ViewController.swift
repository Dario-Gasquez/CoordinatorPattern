//
//  ViewController.swift
//  CoordinatorSample
//
//  Created by Dario on 7/9/19.
//  Copyright © 2019 Dario Gasquez. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var product: UISegmentedControl!
    
    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        coordinator?.createAccount()
    }
    
    @IBAction func didTapBuy(_ sender: UIButton) {
        coordinator?.buySubscription(to: product.selectedSegmentIndex)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
