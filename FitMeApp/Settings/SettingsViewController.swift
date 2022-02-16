//
//  SettingsViewController.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 16/02/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var toggelSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toggelSwitch.setOn(!Helper.getEditable(), animated: false)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressEditable(_ sender: UISwitch) {
            if !sender.isOn {
                Helper.setEditable(value: true)
            } else { Helper.setEditable(value: false)}
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
