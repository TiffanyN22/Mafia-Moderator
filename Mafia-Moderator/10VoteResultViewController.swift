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
        
        let votedOffPlayer = gameSetting.alivePlayerList[votedOutPlayerIndex!]
        if(votedOffPlayer.teamMafia){
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name), and they were Mafia. Good job!")
            voteResultLabel.textColor = UIColor(named: "Maroon")!
        } else{
            voteResultLabel.text = ("You voted off \(votedOffPlayer.name) even though they were \(votedOffPlayer.role).  Try better next time!")
            voteResultLabel.textColor = UIColor(named: "Navy")!
        }
        
        gameSetting.playerDeath(index: votedOutPlayerIndex ?? 0) //TODO: ALERT
    }
    

    @IBAction func nextButtonPressed(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        if(gameSetting.checkGameEnded()){
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
