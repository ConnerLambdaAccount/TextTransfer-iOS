//
//  MainViewController.swift
//  TextTransfer
//
//  Created by conner on 7/3/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var inputTV: UITextView!
    
    // MARK: - Properties
    var receiverDelegate: ReceiverInfoDelegate!
    var receiverInfo = ReceiverInfo(ip: nil, port: nil)

    // MARK: - IBActions
    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let text = inputTV.text, !text.isEmpty, let ip = receiverInfo.ip, let port = receiverInfo.port else { return }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Private Functions
    private func configureViews() {
        self.title = "Text Transfer"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingsSegue" {
            guard let settingsVC = segue.destination as? SettingsViewController else { return }
            settingsVC.receiverDelegate = self
        }
    }
}

extension MainViewController: ReceiverInfoDelegate {
    func didSetReceiverInfo(ip: String, port: Int) {
        receiverInfo.ip = ip
        receiverInfo.port = port
    }
}
