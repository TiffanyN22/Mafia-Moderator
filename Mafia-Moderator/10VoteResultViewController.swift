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
        
        let votedOffPlayer = GameSetting.alivePlayerList[votedOutPlayerIndex!]
        if(votedOffPlayer.teamMafia){
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name), and they were Mafia. Good job!")
            voteResultLabel.textColor = UIColor(named: "Maroon")!
        } else{
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name) even though they were \(votedOffPlayer.role). Try better next time!")
            voteResultLabel.textColor = UIColor(named: "Navy")!
        }
        
        GameSetting.playerDeath(index: votedOutPlayerIndex!)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if(GameSetting.checkGameEnded()){
            guard let displayWinnerViewController = mainStoryboard.instantiateViewController(withIdentifier: "DisplayWinnerViewController") as? DisplayWinnerViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(displayWinnerViewController, animated: true)
        } else{
            guard let mafiaViewController = mainStoryboard.instantiateViewController(withIdentifier: "MafiaNightPhaseViewController") as? MafiaNightPhaseViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(mafiaViewController, animated: true)
        }
    }
}
