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
    
    var murderAttemptIndex: Int = 0 //selector starts off at position 0

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
        //pass variables over
        gameSetting.murderAttemptIndex = self.murderAttemptIndex
//        if segue.identifier == "showDetail" {
//                if let indexPath = self.tableView.indexPathForSelectedRow {
//                    let controller = segue.destination as! ViewControllerB
//                    controller.selectedName = objects[indexPath.row]
//                }
//            }
//        let step2VC = segue.destination as! NightResultViewController //check destination
//        step2VC.murderAttemptIndex = self.murderAttemptIndex
    }
}

//for picker view
extension MafiaNightPhaseViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameSetting.alivePlayerList[row].name
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
        return gameSetting.alivePlayerList.count
    }
}
