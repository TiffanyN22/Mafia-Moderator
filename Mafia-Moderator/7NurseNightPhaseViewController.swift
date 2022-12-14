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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerSelector.delegate = self
        playerSelector.dataSource = self
        playerSelector.setValue(UIColor(named: "Navy")!, forKeyPath: "textColor")
        
        nurseConfirmDecisionButton.titleLabel?.textAlignment = .center
    }

}

//for picker view
extension NurseNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameSetting.alivePlayerList[row].name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: pass selected player to next page
    }
}

extension NurseNightPhaseViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameSetting.alivePlayerList.count
    }
}
