//
//  VoteResultViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/14/22.
//

import UIKit

class VoteResultViewController: UIViewController {
    
    @IBOutlet weak var voteResultLabel: UILabel!
    
    var votedOutPlayerIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var votedOffPlayer = gameSetting.alivePlayerList[votedOutPlayerIndex!]
        if(votedOffPlayer.teamMafia){
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name), and they were Mafia. Good job!")
            voteResultLabel.textColor = UIColor(named: "Maroon")!
        } else{
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name) even though they were \(votedOffPlayer.role).  Try better next time!")
            voteResultLabel.textColor = UIColor(named: "Navy")!
        }
        
        gameSetting.playerDeath(index: votedOutPlayerIndex!)
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
