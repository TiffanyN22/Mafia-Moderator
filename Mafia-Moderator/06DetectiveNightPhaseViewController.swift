//
//  DetectiveNightPhaseViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class DetectiveNightPhaseViewController: UIViewController {

    @IBOutlet weak var playerSelector: UIPickerView!
    @IBOutlet weak var suspectTeamDisplay: UILabel!
    @IBOutlet weak var confirmationDecisionButton: UIButton!
    
    var selection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerSelector.delegate = self
        playerSelector.dataSource = self
        playerSelector.setValue(UIColor(named: "Navy")!, forKeyPath: "textColor")
        
        suspectTeamDisplay.isHidden = true
        
        confirmationDecisionButton.titleLabel?.textAlignment = .center
        
        checkNoDetective()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selection = 0
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //only segue if button says next (player role already displayed
        return (confirmationDecisionButton.titleLabel!.text == "Next")
    }
    
    func checkNoDetective(){
        if(GameSetting.numOfDetective == 0){
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let nurseViewController = mainStoryboard.instantiateViewController(withIdentifier: "NurseNightPhaseViewController") as? NurseNightPhaseViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(nurseViewController, animated: true)
        }
    }
    
    @IBAction func pressedConfirmDecisionButton(_ sender: Any) {
        if confirmationDecisionButton.titleLabel!.text != "Confirm Your Decision"{
            return
        }
        
        //display suspect info
        suspectTeamDisplay.isHidden = false
        if(GameSetting.alivePlayerList[selection].teamMafia){
            suspectTeamDisplay.text = "\(GameSetting.alivePlayerList[selection].name) is a Mafia"
            suspectTeamDisplay.textColor = UIColor(named: "Maroon")!
        } else{
            suspectTeamDisplay.text = "\(GameSetting.alivePlayerList[selection].name) is not a Mafia"
            suspectTeamDisplay.textColor = UIColor(named: "Navy")!
        }
        
        
        //change button text (so that it goes to next page)
        confirmationDecisionButton.setTitle("Next", for: .normal)
        confirmationDecisionButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20.0) //TODO: FIX
    }

}

//for picker view
extension DetectiveNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GameSetting.alivePlayerList[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = row
    }
}

extension DetectiveNightPhaseViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //one column for name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GameSetting.alivePlayerList.count
    }
}

