//
//  DisplayWinnerViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/14/22.
//

import UIKit

class DisplayWinnerViewController: UIViewController {

    @IBOutlet weak var winnerText: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(gameSetting.numOfMafia == 0){ //town won
            view.backgroundColor = UIColor(named: "Navy")!
            homeButton.setTitleColor(UIColor(named: "Navy")!, for: UIControl.State.normal)
            winnerText.text = "Congratulations! Town won becuase they voted off all the mafia!"
        } else{
            view.backgroundColor = UIColor(named: "Maroon")!
            homeButton.setTitleColor(UIColor(named: "Maroon")!, for: UIControl.State.normal)
            winnerText.text = "Congratulations! Mafia won becuase they outnumbered the town!"
        }
    }
}
