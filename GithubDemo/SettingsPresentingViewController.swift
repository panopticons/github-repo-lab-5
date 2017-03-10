//
//  SettingsPresentingViewController.swift
//  GithubDemo
//
//  Created by fer on 3/9/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import Foundation

protocol SettingsPresentingViewControllerDelegate: class {
  func didSaveSettings(settings: GithubRepoSearchSettings)
  func didCancelSettings()
}
