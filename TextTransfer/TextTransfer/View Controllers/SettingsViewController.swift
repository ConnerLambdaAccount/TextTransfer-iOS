//
//  SettingsViewController.swift
//  TextTransfer
//
//  Created by conner on 7/3/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var addrTF: UITextField!
    
    // MARK: - View Lifecycle
    override func viewWillDisappear(_ animated: Bool) {
        guard let
            addrInput = addrTF.text,
            !addrInput.isEmpty,
            addrInput.contains(":"),
            let parsedAddr = addrInput.components(separatedBy: ":"),    // [0] is ip , [1] is port
            !parsedAddr[0].isEmpty,
            !parsedAddr[1].isEmpty,
            let port = Int(parsedAddr[1]) else { return }
        
        print("\(parsedAddr[0])")
        print("\(port)")
    }
}
