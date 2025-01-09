//
//  DataTableViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/23/23.
//

import UIKit

class DataTableViewController: UITableViewController {
    
    var times = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        performSegue(withIdentifier: "ShowLoginScreen", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = times[indexPath.row]
        return cell
    }
    
    @IBAction func unwindToSleepData(segue: UIStoryboardSegue) {
        let sourceVC = segue.source as! TimerViewController
        self.times.append(sourceVC.timeString)
    }
    
    @IBAction func unwindFromLogin(segue: UIStoryboardSegue) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        tableView.reloadData()
    }
    
    @IBAction func moreButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ShowSleepStats", sender: nil)
    }
    
    
}
