//
//  TimerViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/21/23.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    var time = 0
    var timeString = ""
    var timer = Timer()
    var timerCounting = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        timerLabel!.text = getTimeString(hours: 0, minutes: 0, seconds: 0)
        startStopButton.setTitleColor(.red, for: .normal)
        startStopButton.setTitle("Stop", for: .normal)
        initTimer()
    }
    
    @IBAction func startStopButtonPressed(_ sender: UIButton) {
        if timerCounting {
            timerCounting.toggle()
            timer.invalidate()
            startStopButton.setTitleColor(.green, for: .normal)
            startStopButton.setTitle("Start", for: .normal)
        } else {
            timerCounting.toggle()
            startStopButton.setTitleColor(.red, for: .normal)
            startStopButton.setTitle("Stop", for: .normal)
            initTimer()
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        timerCounting = true
        self.startStopButtonPressed(sender)
        let alert = UIAlertController(title: "Save Time", message: "Would you like to save this time? You will be returned to the menu!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            self.startStopButtonPressed(sender)
        }))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "UnwindToSleepData", sender: nil)
            self.timer.invalidate()
            self.navigationController!.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounter() -> Void {
        self.time += 1
        let time = secondsToTime(seconds: self.time)
        timerLabel.text = getTimeString(hours: time.0, minutes: time.1, seconds: time.2)
    }
    
    func secondsToTime(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func getTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        self.timeString = timeString
        return timeString
    }


    

}
