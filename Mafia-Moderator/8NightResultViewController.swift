//
//  NightResultViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class NightResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (gameSetting.murderAttemptIndex == gameSetting.saveAttemptIndex){
            resultLabel.text = "There was a murder attempt on \(gameSetting.alivePlayerList[gameSetting.murderAttemptIndex].name), but they were saved"
        } else{
            resultLabel.text = "\(gameSetting.alivePlayerList[gameSetting.murderAttemptIndex].name) was killed during the night"
            gameSetting.playerDeath(index: gameSetting.murderAttemptIndex)
        }
        //display players for test
//        var playerListText=""
//        for player in gameSetting.alivePlayerList{
//            playerListText.append("\n\(player.name)")
//        }
//        resultLabel.text = playerListText
    }


}
