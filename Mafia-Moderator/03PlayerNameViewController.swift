//
//  File Name: PlayerNameViewController.swift
//  Project: Mafia-Moderator
//  Description: The file allows the user to enter in names for all players and randomly assigns their role
//  Author: Tiffany Nguyen
//  Acknowledgement: Logic for Fisher-Yates shuffle algorithm code came from https://www.w3docs.com/snippets/javascript/how-to-randomize-shuffle-a-javascript-array.html
//  Creation Date: 12/13/22.
//

import UIKit

class PlayerNameViewController: UIViewController {

    @IBOutlet weak var NamesList: UILabel!
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var UndoButton: UIButton!
    @IBOutlet weak var AddButton: UIButton!
    
    var namesAdded=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UndoButton.tintColor = UIColor(named: "GhostlyBlue")
        AddButton.tintColor = UIColor(named: "GhostlyBlue")
        NamesList.text = ""
        gameSetting.playerList=[] //clear in case go back
    }
    
    func randomizeRoles(){
        //start off by assigning roles in order
        if(gameSetting.numOfCivilian>0){
            for i in 0...(gameSetting.numOfCivilian-1) {
                gameSetting.playerList[i].role = "Civilian"
            }
        }
        if(gameSetting.numOfDetective>0){
            for i in 0...(gameSetting.numOfDetective-1) {
                gameSetting.playerList[gameSetting.numOfCivilian + i].role = "Detective"
            }
        }
        if(gameSetting.numOfNurse>0){
            for i in 0...(gameSetting.numOfNurse-1) {
                gameSetting.playerList[gameSetting.numOfCivilian + gameSetting.numOfDetective + i].role = "Nurse"
            }
        }
        if(gameSetting.numOfMafia>0){
            for i in 0...(gameSetting.numOfMafia-1) {
                gameSetting.playerList[gameSetting.numOnTeamTown + i].role = "Mafia"
            }
        }
        
        //shuffle using Fisher-Yates shuffle algorithm
        var curId = gameSetting.playerList.count
        while(curId != 0){
            //pick remaining element
            let randomIndex = Int.random(in: 0...(curId-1))
            curId-=1
            //swap
            let temp = gameSetting.playerList[curId].role
            gameSetting.playerList[curId].role=gameSetting.playerList[randomIndex].role
            gameSetting.playerList[randomIndex].role=temp
        }
        
        //assign team mafia for mafia
        for player in gameSetting.playerList{
            if player.role == "Mafia"{
                player.teamMafia = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        randomizeRoles()
        gameSetting.alivePlayerList = gameSetting.playerList
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //only segue if all names inputted
        return (AddButton.titleLabel?.text == "Next")
    }
                
    @IBAction func PressUndo(_ sender: Any) {
        if(namesAdded != 0){
            gameSetting.playerList.removeLast()
            updateDisplayedNames()
            namesAdded-=1
            if(AddButton.titleLabel?.text == "Next"){
                AddButton.setTitle("Add", for: .normal)
            }
        } else{
            let alertController = UIAlertController(title: "Undo Error", message: "You cannot undo when there are no players added", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return;
        }
    }
    
    @IBAction func PressAdd(_ sender: Any) {
        //if the label is next, segue and don't try to add name
        if(AddButton.titleLabel?.text == "Next"){
            return
        }
        
        //check that there is name in text box
        if(NameInput.text == ""){
            let alertController = UIAlertController(title: "Enter Name", message: "Enter a name into the text field before clicking add", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return;
        }
        
        //add player to playerList
        gameSetting.playerList.append(Player(name: NameInput.text ?? "error"))
        NameInput.text = ""
        namesAdded+=1
        
        //update names text box
        updateDisplayedNames()
        
        //see if all names added
        if(namesAdded == gameSetting.numOfPlayers){
            AddButton.setTitle("Next", for: .normal)
        }
    }
    
    func updateDisplayedNames(){
        var namesList = ""
        for player in gameSetting.playerList{
            namesList.append("\n \(player.name)")
        }
        NamesList.text=namesList;
    }
}
