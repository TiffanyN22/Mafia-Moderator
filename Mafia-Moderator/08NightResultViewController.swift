//
//  NightResultViewController.swift
//  Mafia-Moderator
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class NightResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var beginDiscussionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (GameSetting.murderAttemptIndex == GameSetting.saveAttemptIndex){
            resultLabel.text = "There was a murder attempt on \(GameSetting.alivePlayerList[GameSetting.murderAttemptIndex].name), but they were saved"
        } else{
            resultLabel.text = "\(GameSetting.alivePlayerList[GameSetting.murderAttemptIndex].name) was killed during the night. They were a \(GameSetting.alivePlayerList[GameSetting.murderAttemptIndex].role)"
            GameSetting.playerDeath(index: GameSetting.murderAttemptIndex)
        }
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

        //display players for test
/*
        var playerListText=""
            for player in GameSetting.alivePlayerList{
            playerListText.append("\n\(player.name)")
        }
        resultLabel.text = playerListText
*/
        
    @IBAction func beginDiscussionButtonPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if(GameSetting.checkGameEnded()){
            guard let displayWinnerViewController = mainStoryboard.instantiateViewController(withIdentifier: "DisplayWinnerViewController") as? DisplayWinnerViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(displayWinnerViewController, animated: true)
        } else{
            guard let discussionViewController = mainStoryboard.instantiateViewController(withIdentifier: "DiscussionViewController") as? DiscussionViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(discussionViewController, animated: true)
        }
    }
}
