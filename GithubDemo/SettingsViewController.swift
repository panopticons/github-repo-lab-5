//
//  settingsViewController.swift
//  GithubDemo
//
//  Created by fer on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
  
  weak var delegate: SettingsPresentingViewControllerDelegate?
  var settings = GithubRepoSearchSettings()
  
  @IBOutlet weak var sliderR: UISlider!
  @IBOutlet weak var slideValue: UILabel!
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      sliderR.value = Float(settings.minStars)
      slideValue.text = "\(Int(sliderR.value))"
    // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func edit(_ sender: UISlider) {
    slideValue.text = "\(Int(sliderR.value))"
    settings.minStars = Int(sliderR.value)
  }
  
  @IBAction func cancel(_ sender: Any) {
  self.delegate?.didCancelSettings()
  }

  @IBAction func save(_ sender: Any) {
    self.delegate?.didSaveSettings(settings: settings)
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
