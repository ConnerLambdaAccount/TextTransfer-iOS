//
//  MainViewController.swift
//  TextTransfer
//
//  Created by conner on 7/3/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit
import SwiftSocket

class MainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var inputTV: UITextView!

    // MARK: - IBActions
    @IBAction func sendButtonTapped(_ sender: Any) {
        guard let text = inputTV.text, !text.isEmpty else { return }
        sendTextToServer(text)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - Private Functions
    private func sendTextToServer(_ text: String) {
        print("IP: \(ip)")
        print("Port: \(port)")
    
    }
    
    private func configureViews() {
        self.title = "Text Transfer"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
