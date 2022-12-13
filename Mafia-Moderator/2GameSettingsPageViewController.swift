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
    @IBOutlet weak var GameSettingsTitleText: UILabel!
    @IBOutlet weak var SubtitleText: UILabel!
    @IBOutlet weak var DoneButton: UIButton!
    
    //settings text and stepper
    @IBOutlet weak var NumofCivilianText: UILabel!
    @IBOutlet weak var NumOfCivilianStepper: UIStepper!
    @IBOutlet weak var NumOfMafiaText: UILabel!
    @IBOutlet weak var NumOfMafiaStepper: UIStepper!
    @IBOutlet weak var NumOfDetectiveText: UILabel!
    @IBOutlet weak var NumOfDetectiveStepper: UIStepper!
    @IBOutlet weak var NumOfNurseText: UILabel!
    @IBOutlet weak var NumOfNurseStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubtitleText.numberOfLines=0
        SubtitleText.text = "Enter the number of people \n tied into this Mafia \nscheme"
        
        NumofCivilianText.text="  Number of Civilians: \(Int(NumOfCivilianStepper.value))"
        NumOfMafiaText.text="  Number of Mafia: \(Int(NumOfMafiaStepper.value))"
        NumOfDetectiveText.text="  Number of Detectives: \(Int(NumOfDetectiveStepper.value))"
        NumOfNurseText.text="  Number of Nurses: \(Int(NumOfNurseStepper.value))"
    }
    
    //update number labels when stepper is pressed
    @IBAction func updatePlayerNum(_ sender: Any) {
        NumofCivilianText.text="  Number of Civilians: \(Int(NumOfCivilianStepper.value))"
    }
    @IBAction func updateMafiaNum(_ sender: Any) {
        NumOfMafiaText.text="  Number of Mafia: \(Int(NumOfMafiaStepper.value))"
    }
    @IBAction func updateDetectiveNum(_ sender: Any) {
        NumOfDetectiveText.text="  Number of Detectives: \(Int(NumOfDetectiveStepper.value))"
    }
    @IBAction func updateNurseNum(_ sender: Any) {
        NumOfNurseText.text="  Number of Nurses: \(Int(NumOfNurseStepper.value))"
    }

    //navigate to next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        gameSetting.numOfCivilian=Int(NumOfCivilianStepper.value)
        gameSetting.numOfMafia=Int(NumOfMafiaStepper.value)
        gameSetting.numOfDetective=Int(NumOfDetectiveStepper.value)
        gameSetting.numOfNurse=Int(NumOfNurseStepper.value)
        gameSetting.numOnTeamTown=gameSetting.numOfCivilian!+gameSetting.numOfDetective!+gameSetting.numOfNurse!
        gameSetting.numOfPlayers=gameSetting.numOnTeamTown!+gameSetting.numOfMafia!
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let numOfPlayers = NumOfCivilianStepper.value + NumOfMafiaStepper.value + NumOfDetectiveStepper.value + NumOfNurseStepper.value
        //check more than 3 player
        if numOfPlayers <= 3{
            let alertController = UIAlertController(title: "Too Few Players", message: "There must be at least 4 players to begin game", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false //segway won't continue
        }
        //mafia cannot outnumber town
        else if (NumOfMafiaStepper.value>=(numOfPlayers-NumOfMafiaStepper.value)){
            let alertController = UIAlertController(title: "Too Many Mafia", message: "The number of mafia cannot be greater than or equal to the number of civilians", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false
        }
        //must be at least one mafia
        else if (NumOfMafiaStepper.value == 0){
            let alertController = UIAlertController(title: "No Mafia", message: "There must be at least one mafia for the game to begin", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return false
        }
        return true
    }

}
