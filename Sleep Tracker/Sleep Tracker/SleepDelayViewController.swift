//
//  SleepTimerViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/6/23.
//

import UIKit

class SleepDelayViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var time: Int
    var resetTime: Int
    var timer = Timer()
    
    init?(coder: NSCoder, time: Double) {
        self.time = Int(time)
        self.resetTime = Int(time)
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let time = secondsToTime(seconds: self.time)
        timerLabel!.text = getTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        cancelButton.setTitleColor(.red, for: .normal)
        initTimer()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        let alert = UIAlertController(title: "Reset Timer", message: "Would you like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            self.viewDidLoad()
        }))
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.time = self.resetTime
            self.viewDidLoad()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    func initTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeCounter() -> Void {
        self.time -= 1
        let time = secondsToTime(seconds: self.time)
        timerLabel.text = getTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        if timerLabel.text == "00:00:00" {
            self.time = resetTime
            timer.invalidate()
            performSegue(withIdentifier: "ShowSleepTimer", sender: nil)
        }
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
        return timeString
    }
    
    
    
}
