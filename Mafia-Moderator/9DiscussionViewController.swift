//
//  DiscussionViewController.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/14/22.
//

import UIKit

class DiscussionViewController: UIViewController {

    @IBOutlet weak var discussionPlayerSelector: UIPickerView!
    var selectionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discussionPlayerSelector.delegate = self
        discussionPlayerSelector.dataSource = self
        discussionPlayerSelector.setValue(UIColor(named: "Navy")!, forKeyPath: "textColor")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DiscussionViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameSetting.alivePlayerList[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionIndex = row
    }
}

extension DiscussionViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //one column for name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameSetting.alivePlayerList.count
    }
}
