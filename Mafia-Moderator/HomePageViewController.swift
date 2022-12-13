//
//  HomePageViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/12/22.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
    }
    */

}
