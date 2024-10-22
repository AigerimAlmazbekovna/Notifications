//
//  ViewController.swift
//  AigerimNotification
//
//  Created by Айгерим on 22.10.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocalNotificationService.shared.registerForLatestIfPossible()
    }


    @IBAction func requestNotification(_ sender: UIButton) {
        LocalNotificationService.shared.registerForLatestIfPossible()
    }
    
}
//
