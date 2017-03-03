//
//  settingsViewController.swift
//  GithubDemo
//
//  Created by fer on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsPresentingViewControllerDelegate {
  
  var settings: GithubRepoSearchSettings!
  weak var delegate: SettingsPresentingViewControllerDelegate?
  /*var cancelButton: UIBarButtonItem!
  var saveButton: UIBarButtonItem!
  var saveL: UILabel!
  var cancelL: UILabel!*/
  @IBOutlet weak var slideValue: UILabel!
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
      /*cancelButton = UIBarButtonItem()
      saveButton = UIBarButtonItem()
    
      saveL = UILabel()
      cancelL = UILabel()
    
      saveL.text = "Save"
      saveL.textAlignment = .center
      saveL.sizeToFit()
    
      cancelL.text = "Cancel"
      cancelL.textAlignment = .center
      cancelL.sizeToFit()
      navigationItem.setRightBarButton(saveButton, animated: true)
      navigationItem.setLeftBarButton(cancelButton, animated: true)*/
    
    // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func edit(_ sender: UISlider) {
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
