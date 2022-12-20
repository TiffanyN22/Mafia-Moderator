//
//  ShowRolesViewController.swift
//  Project: Mafia-Moderator
//  Description: Page to View Roles
//  Author: Tiffany Nguyen
//  Creation Date: 12/13/22.
//

import UIKit
import SwiftUI

class ShowRolesViewController: UIViewController {
        
    @IBOutlet weak var enterNightButton: UIButton!
    
    fileprivate let rolesCardUI = UIHostingController(rootView: ShowRolesUI())

    override func viewDidLoad() {
        super.viewDidLoad()
        enterNightButton.tintColor = UIColor(named: "GhostlyBlue")
        
        //set up card swiftUI
        setupHC()
        rolesCardUI.view.frame = .init(x: 1, y: 275, width: 400, height: 400)
    }
    
    
    fileprivate func setupHC(){
        addChild(rolesCardUI) //add controller
        view.addSubview(rolesCardUI.view) //add view
        rolesCardUI.didMove(toParent: self)
    }
}

