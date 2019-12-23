//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        let hardness = sender.currentTitle!
        words.text = hardness
        var secondsRemaing = eggTimes[hardness]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if (secondsRemaing == 0){
                self.words.text = "DONE!"
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
                self.timer.invalidate();
            }
            else {
                self.progressBar.progress += 1.0/Float(self.eggTimes[hardness]!)
                secondsRemaing-=1
            }
        }
    }
}
