//
//  MafiaNightPhaseViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/13/22.
//

import UIKit

class MafiaNightPhaseViewController: UIViewController{

    @IBOutlet weak var mafiaPlayerSelector: UIPickerView!
    @IBOutlet weak var ConfirmDecisionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mafiaPlayerSelector.delegate = self
        mafiaPlayerSelector.dataSource = self
        mafiaPlayerSelector.setValue(UIColor(named: "Maroon")!, forKeyPath: "textColor")
        
        ConfirmDecisionButton.tintColor = UIColor(named: "CyanAccent")
        ConfirmDecisionButton.titleLabel?.text = "Confirm Your Decision"
        ConfirmDecisionButton.titleLabel?.textAlignment = .center
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: pass selected player to page that determines death
    }
}

//for picker view
extension MafiaNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameSetting.alivePlayerList[row].name
    }
}

extension MafiaNightPhaseViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //one column for name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameSetting.alivePlayerList.count
    }
}
