//
//  PlayerNameViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class PlayerNameViewController: UIViewController {

    @IBOutlet weak var NamesList: UILabel!
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var UndoButton: UIButton!
    @IBOutlet weak var AddButton: UIButton!
    
    var namesAdded = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UndoButton.tintColor = UIColor(named: "GhostlyBlue")
        AddButton.tintColor = UIColor(named: "GhostlyBlue")
        NamesList.text = ""
        //clear in case go back
        gameSetting.playerList=[]
    }
    
    func randomizeRoles(){
        //TODO:
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
        //TODO: scroll if too many names?
        var namesList = ""
        for player in gameSetting.playerList{
            namesList.append("\n \(player.name ?? "error")")
        }
        NamesList.text=namesList;
    }
}
