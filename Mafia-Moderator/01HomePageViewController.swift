//
//  File Name: HomePageViewController.swift
//  Project: Mafia-Moderator
//  Description: Basic home page with title text and button to go to next page
//  Author: Tiffany Nguyen
//  Creation Date: 12/12/22
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var SubtitleText: UILabel!
    @IBOutlet weak var PlayNowButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleText.numberOfLines=0
        TitleText.lineBreakMode = .byWordWrapping
        TitleText.text="Mafia\nModerator"
        
        SubtitleText.numberOfLines=0
        SubtitleText.text = "The ultimate game of murder and deception"
        
        PlayNowButton.titleLabel?.text = "Play Now"
    }
}
