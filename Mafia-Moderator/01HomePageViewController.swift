//
//  File Name: HomePageViewController.swift
//  Project: Mafia-Moderator
//  Description: Basic home page with title text and button to go to next page
//  Author: Tiffany Nguyen
//  Creation Date: 12/12/22
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    @IBOutlet weak var playNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.numberOfLines=0
        titleText.lineBreakMode = .byWordWrapping
        titleText.text="Mafia\nModerator"
        
        subtitleText.numberOfLines=0
        subtitleText.text = "The ultimate game of murder and deception"
        
        playNowButton.titleLabel?.text = "Play Now"
    }
}
