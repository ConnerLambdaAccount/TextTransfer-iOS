//
//  SettingsViewController.swift
//  TextTransfer
//
//  Created by conner on 7/3/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

protocol ReceiverInfoDelegate {
    func didSetReceiverInfo(ip: String, port: Int)
}

class SettingsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var addrTF: UITextField!
    
    // MARK: - Properties
    var receiverDelegate: ReceiverInfoDelegate!
    
    // MARK: - View Lifecycle
    override func viewWillDisappear(_ animated: Bool) {
        guard let
            addrInput = addrTF.text,
            !addrInput.isEmpty,
            addrInput.contains(":") else { return }
        
        let parsedAddr = addrInput.components(separatedBy: ":")    // [0] is ip, [1] is port
        
        guard
            !parsedAddr[0].isEmpty,
            !parsedAddr[1].isEmpty,
            let port = Int(parsedAddr[1]) else { return }
        
        // Pass IP and Port to MainViewController
        receiverDelegate.didSetReceiverInfo(ip: parsedAddr[0], port: port)
    }
}
