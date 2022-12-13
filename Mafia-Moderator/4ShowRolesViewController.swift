//
//  ShowRolesViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class ShowRolesViewController: UIViewController {

    @IBOutlet weak var RolesDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var text=""
        for i in 0...(gameSetting.numOfPlayers-1){
            text.append("\n \(gameSetting.playerList[i].name): \(gameSetting.playerList[i].role)")
        }
        RolesDisplay.text=text
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
