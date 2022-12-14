//
//  DetectiveNightPhaseViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class DetectiveNightPhaseViewController: UIViewController {

    @IBOutlet weak var PlayerSelector: UIPickerView!
    @IBOutlet weak var SuspectTeamDisplay: UILabel!
    @IBOutlet weak var ConfirmDecisionButton: UIButton!
    
    var selection: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayerSelector.delegate = self
        PlayerSelector.dataSource = self
        PlayerSelector.setValue(UIColor(named: "Navy")!, forKeyPath: "textColor")
        
        SuspectTeamDisplay.isHidden = true
        
        ConfirmDecisionButton.titleLabel?.textAlignment = .center
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //only segue if button says next (player role already displayed
        return (ConfirmDecisionButton.titleLabel!.text == "Next")
    }
    
    @IBAction func pressedConfirmDecisionButton(_ sender: Any) {
        if ConfirmDecisionButton.titleLabel!.text != "Confirm Your Decision"{
            return
        }
        
        //display suspect info
        SuspectTeamDisplay.isHidden = false
        if(gameSetting.alivePlayerList[selection].teamMafia){
            SuspectTeamDisplay.text = "\(gameSetting.alivePlayerList[selection].name) is a Mafia"
            SuspectTeamDisplay.textColor = UIColor(named: "Maroon")!
        } else{
            SuspectTeamDisplay.text = "\(gameSetting.alivePlayerList[selection].name) is not a Mafia"
            SuspectTeamDisplay.textColor = UIColor(named: "Navy")!
        }
        
        
        //change button text (so that it goes to next page)
        ConfirmDecisionButton.setTitle("Next", for: .normal)
        ConfirmDecisionButton.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20.0) //TODO: FIX
    }

}

//for picker view
extension DetectiveNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameSetting.alivePlayerList[row].name
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
        return gameSetting.alivePlayerList.count
    }
}

