//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingsPresentingViewControllerDelegate {

    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    var repos: [GithubRepo]!
    var settingsButton: UIBarButtonItem!
    var set: UILabel!
  
  @IBOutlet weak var repoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        repoTable.dataSource = self
        repoTable.delegate = self
      
        //repoTable.estimatedRowHeight = 200
        //repoTable.rowHeight = UITableViewAutomaticDimension
      
      
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
      
        /*
        // Add settingsButton
        settingsButton = UIBarButtonItem()
      
        set = UILabel()
        set.text = "Settings"
        set.textAlignment = .center
        set.sizeToFit()
      
        settingsButton.title = set.text
      
        navigationItem.setRightBarButton(settingsButton, animated: true)
        */
      
        // Perform the first search when the view controller first loads
        doSearch()
    }

    // Perform the search.
    fileprivate func doSearch() {
        MBProgressHUD.showAdded(to: self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in

            // Print the returned repositories to the output window
            for repo in newRepos {
                print(repo)
            }   
            
            self.repos = newRepos
            self.repoTable.reloadData()
          
            MBProgressHUD.hide(for: self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if let repos = repos {
          return repos.count
      }
      else {
        return 0
      }
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! GTableViewCell
        
      let singleRepo = repos[indexPath.row]
      let imageURL = singleRepo.ownerAvatarURL
        
      cell.nameLabel.text = singleRepo.name
      cell.ownerLabel.text = "by " + singleRepo.ownerHandle!
      cell.avatarView.setImageWith(URL(string: imageURL!)!)
      cell.forksLabel.text = "\(singleRepo.forks!)"
      cell.starsLabel.text = "\(singleRepo.stars!)"
      cell.descriptionLabel.text = singleRepo.repoDescription
        
      return cell
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let navController = segue.destination as! UINavigationController
    let vc = navController.topViewController as! SettingsViewController
    vc.settings =  searchSettings
    vc.delegate = self
    
  }
  
  func didSaveSettings(settings: GithubRepoSearchSettings) {
    searchSettings = settings
    
    doSearch()
    //print("New Search")
    self.dismiss(animated: true, completion: nil)
  }
  
  func didCancelSettings() {
    self.dismiss(animated: true, completion: nil)
  }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
