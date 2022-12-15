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
            winnerText.text = "Congratulations! Town won becuase they voted off all the mafia!"
            view.backgroundColor = UIColor(named: "Navy")!
            homeButton.setTitleColor(UIColor(named: "Navy")!, for: UIControl.State.normal)
    
        } else{
            winnerText.text = "Congratulations! Mafia won becuase they outnumbered the town!"
            view.backgroundColor = UIColor(named: "Maroon")!
            homeButton.setTitleColor(UIColor(named: "Maroon")!, for: UIControl.State.normal)
        }

        // Do any additional setup after loading the view.
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
