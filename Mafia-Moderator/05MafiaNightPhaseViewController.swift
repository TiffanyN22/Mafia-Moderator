//
//  MafiaNightPhaseViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class MafiaNightPhaseViewController: UIViewController{

    @IBOutlet weak var mafiaPlayerSelector: UIPickerView!
    @IBOutlet weak var confirmDecisionButton: UIButton!
    
    var murderAttemptIndex: Int = 0 //selector starts off at position 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mafiaPlayerSelector.delegate = self
        mafiaPlayerSelector.dataSource = self
        mafiaPlayerSelector.setValue(UIColor(named: "Maroon")!, forKeyPath: "textColor")
        
        confirmDecisionButton.tintColor = UIColor(named: "CyanAccent")
        confirmDecisionButton.titleLabel?.text = "Confirm Your Decision"
        confirmDecisionButton.titleLabel?.textAlignment = .center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        murderAttemptIndex = 0 //reset selector to 0 when coming back to this screen
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        GameSetting.murderAttemptIndex = self.murderAttemptIndex
    }
}

//for picker view
extension MafiaNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GameSetting.alivePlayerList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.murderAttemptIndex = row
    }
}

extension MafiaNightPhaseViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //one column for name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GameSetting.alivePlayerList.count
    }
}
