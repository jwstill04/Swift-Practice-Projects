//
//  HomeViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/1/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var timePicker: UIDatePicker!
    
    var timerVal = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func updateTimerVal(_ sender: UIDatePicker, forEvent event: UIEvent) {
        timerVal = timePicker.countDownDuration
    }
    
    @IBAction func timeSet(_ sender: UIButton) {
        timerVal = timePicker.countDownDuration
        tabBarController?.tabBar.isHidden = true
        performSegue(withIdentifier: "ShowTimerSegue", sender: sender)
    }
    
    @IBSegueAction func sendTimerVal(_ coder: NSCoder) -> SleepDelayViewController? {
        return SleepDelayViewController(coder: coder, time: timerVal)
    }
    
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {
    }
    

}



