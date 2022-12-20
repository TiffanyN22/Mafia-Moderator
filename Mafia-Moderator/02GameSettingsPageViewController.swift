//
//  File Name: GameSettingsPageViewController.swift
//  Project: Mafia-Moderator
//  Description: Settings page to decide number of mafia, civilians, detectives, and nurses
//  Author: Tiffany Nguyen
//  Acknowledgement: Logic for validation alerts came from https://youtu.be/_LtGwrkXigQ
//  Creation Date: 12/12/22
//

import UIKit

class GameSettingsPageViewController: UIViewController {
    
    //general items
    @IBOutlet weak var gameSettingsTitleText: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    //settings text and stepper
    @IBOutlet weak var numOfCiviliansText: UILabel!
    @IBOutlet weak var numOfCiviliansStepper: UIStepper!
    @IBOutlet weak var numOfMafiaText: UILabel!
    @IBOutlet weak var numOfMafiaStepper: UIStepper!
    @IBOutlet weak var numOfDetectivesText: UILabel!
    @IBOutlet weak var numOfDetectivesStepper: UIStepper!
    @IBOutlet weak var numOfNursesText: UILabel!
    @IBOutlet weak var num: UIStepper!
    @IBOutlet weak var numOfNursesStepper: UIStepper!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subtitleText.numberOfLines=0
        subtitleText.text = "Enter the number of people \n tied into this Mafia \nscheme"
        
        numOfCiviliansText.text="  Number of Civilians: \(Int(numOfCiviliansStepper.value))"
        numOfMafiaText.text="  Number of Mafia: \(Int(numOfMafiaStepper.value))"
        numOfDetectivesText.text="  Number of Detectives: \(Int(numOfDetectivesStepper.value))"
        numOfNursesText.text="  Number of Nurses: \(Int(numOfNursesStepper.value))"
    }
    
    //update number labels when stepper is pressed
    @IBAction func updatePlayerNum(_ sender: Any) {
        numOfCiviliansText.text="  Number of Civilians: \(Int(numOfCiviliansStepper.value))"
    }
    @IBAction func updateMafiaNum(_ sender: Any) {
        numOfMafiaText.text="  Number of Mafia: \(Int(numOfMafiaStepper.value))"
    }
    @IBAction func updateDetectiveNum(_ sender: Any) {
        numOfDetectivesText.text="  Number of Detectives: \(Int(numOfDetectivesStepper.value))"
    }
    @IBAction func updateNurseNum(_ sender: Any) {
        numOfNursesText.text="  Number of Nurses: \(Int(numOfNursesStepper.value))"
    }

    //navigate to next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        GameSetting.numOfCivilian=Int(numOfCiviliansStepper.value)
        GameSetting.numOfMafia=Int(numOfMafiaStepper.value)
        GameSetting.numOfDetective=Int(numOfDetectivesStepper.value)
        GameSetting.numOfNurse=Int(numOfNursesStepper.value)
        GameSetting.numOnTeamTown=GameSetting.numOfCivilian+GameSetting.numOfDetective+GameSetting.numOfNurse
        GameSetting.numOfPlayers=GameSetting.numOnTeamTown+GameSetting.numOfMafia
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let numOfPlayers = numOfCiviliansStepper.value + numOfMafiaStepper.value + numOfDetectivesStepper.value + numOfNursesStepper.value
        //check more than 3 player
        if numOfPlayers <= 3{
            let alertController = UIAlertController(title: "Too Few Players", message: "There must be at least 4 players to begin game", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false //segway won't continue
        }
        //mafia cannot outnumber town
        else if (numOfMafiaStepper.value>=(numOfPlayers-numOfMafiaStepper.value)){
            let alertController = UIAlertController(title: "Too Many Mafia", message: "The number of mafia cannot be greater than or equal to the number of civilians", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false
        }
        //must be at least one mafia
        else if (numOfMafiaStepper.value == 0){
            let alertController = UIAlertController(title: "No Mafia", message: "There must be at least one mafia for the game to begin", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false
        }
        return true
    }

}
