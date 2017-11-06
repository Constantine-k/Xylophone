//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer?
    private let soundFileList = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(withName: soundFileList[sender.tag - 1])
    }
    
    func playSound(withName soundName: String) {
        let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        do {
            guard let soundURL = soundURL else { return }
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print("Error: \(error)")
        }
        
        audioPlayer?.play()
    }

}

