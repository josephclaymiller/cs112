//
//  ViewController.swift
//  Watch
//
//  Created by Max Luttrell on 10/20/16.
//  Copyright © 2016 Max Luttrell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let watch = Watch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func startButton(sender: UIButton) {
        // only start the watch if we are not already running
        if !watch.isRunning()  {
            watch.start()
            NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateElapsedTime(_:)), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func resetButton(sender: UIButton) {
        if watch.isRunning() == false {
            timeLabel.text = "0.0"
            watch.reset()
        }
    }

    @IBAction func stopButton(sender: UIButton) {
        if watch.isRunning() {
            watch.stop()    
        }
    }
    
    func updateElapsedTime(timer: NSTimer) {
        if watch.isRunning() {
            timeLabel.text = String(format:"%.1f", watch.elapsedTime())
        } else {
            // invalidate the timer
            timer.invalidate()
        }
    }
}

