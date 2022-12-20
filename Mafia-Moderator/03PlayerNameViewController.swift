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

    @IBOutlet weak var namesList: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var namesAdded=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        undoButton.tintColor = UIColor(named: "GhostlyBlue")
        addButton.tintColor = UIColor(named: "GhostlyBlue")
        namesList.text = ""
        GameSetting.playerList=[] //clear in case go back
    }
    
    func randomizeRoles(){
        //start off by assigning roles in order
        if(GameSetting.numOfCivilian>0){
            for i in 0...(GameSetting.numOfCivilian-1) {
                GameSetting.playerList[i].role = "Civilian"
            }
        }
        if(GameSetting.numOfDetective>0){
            for i in 0...(GameSetting.numOfDetective-1) {
                GameSetting.playerList[GameSetting.numOfCivilian + i].role = "Detective"
            }
        }
        if(GameSetting.numOfNurse>0){
            for i in 0...(GameSetting.numOfNurse-1) {
                GameSetting.playerList[GameSetting.numOfCivilian + GameSetting.numOfDetective + i].role = "Nurse"
            }
        }
        if(GameSetting.numOfMafia>0){
            for i in 0...(GameSetting.numOfMafia-1) {
                GameSetting.playerList[GameSetting.numOnTeamTown + i].role = "Mafia"
            }
        }
        
        //shuffle using Fisher-Yates shuffle algorithm
        var curId = GameSetting.playerList.count
        while(curId != 0){
            //pick remaining element
            let randomIndex = Int.random(in: 0...(curId-1))
            curId-=1
            //swap
            let temp = GameSetting.playerList[curId].role
            GameSetting.playerList[curId].role=GameSetting.playerList[randomIndex].role
            GameSetting.playerList[randomIndex].role=temp
        }
        
        //assign team mafia for mafia
        for player in GameSetting.playerList{
            if player.role == "Mafia"{
                player.teamMafia = true
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        randomizeRoles()
        GameSetting.alivePlayerList = GameSetting.playerList
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //only segue if all names inputted
        return (addButton.titleLabel?.text == "Next")
    }
                
    @IBAction func PressUndo(_ sender: Any) {
        if(namesAdded != 0){
            GameSetting.playerList.removeLast()
            updateDisplayedNames()
            namesAdded-=1
            if(addButton.titleLabel?.text == "Next"){
                addButton.setTitle("Add", for: .normal)
                addButton.titleLabel?.font = UIFont(name: "Chalkboard SE Regular", size: 20)
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
        if(addButton.titleLabel?.text == "Next"){
            return
        }
        
        //check that there is name in text box
        if(nameInput.text == ""){
            let alertController = UIAlertController(title: "Enter Name", message: "Enter a name into the text field before clicking add", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController,animated: true, completion: nil)
            return;
        }
        
        //add player to playerList
        GameSetting.playerList.append(Player(name: nameInput.text ?? "error"))
        nameInput.text = ""
        namesAdded+=1
        
        //update names text box
        updateDisplayedNames()
        
        //see if all names added
        if(namesAdded == GameSetting.numOfPlayers){
            addButton.setTitle("Next", for: .normal)
        }
    }
    
    func updateDisplayedNames(){
        var namesListText = ""
        for player in GameSetting.playerList{
            namesListText.append("\n \(player.name)")
        }
        namesList.text=namesListText;
    }
}
