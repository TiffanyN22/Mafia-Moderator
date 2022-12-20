//
//  NurseNightPhaseViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class NurseNightPhaseViewController: UIViewController {

    @IBOutlet weak var playerSelector: UIPickerView!
    @IBOutlet weak var nurseConfirmDecisionButton: UIButton!
    
    var saveAttemptIndex: Int = 0 //selector starts off at position 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerSelector.delegate = self
        playerSelector.dataSource = self
        playerSelector.setValue(UIColor(named: "Navy")!, forKeyPath: "textColor")
        
        nurseConfirmDecisionButton.titleLabel?.textAlignment = .center
        
        checkNoNurse()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveAttemptIndex = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        GameSetting.saveAttemptIndex = self.saveAttemptIndex
    }
    
    func checkNoNurse(){
        if(GameSetting.numOfNurse == 0){
            GameSetting.saveAttemptIndex = -1 //-1 means no save, impossible index
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let nightResultStoryboard = mainStoryboard.instantiateViewController(withIdentifier: "NightResultStoryboard") as? NightResultViewController else{
                print("Couldn't find view controller")
                return
            }
            navigationController?.pushViewController(nightResultStoryboard, animated: true)
        }
    }
}

//for picker view
extension NurseNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GameSetting.alivePlayerList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveAttemptIndex = row
    }
}

extension NurseNightPhaseViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GameSetting.alivePlayerList.count
    }
}
