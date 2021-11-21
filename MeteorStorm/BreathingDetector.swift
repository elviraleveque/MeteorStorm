//
//  BreathingDetector.swift
//  MeteorStorm
//
//  Created by Fabiana Ferrara on 16/11/21.
//

import Foundation
import AVFoundation

class BreathRecognizer: NSObject {
    /// Threshold in decibels (-160 < threshold < 0)
    let threshold: Float

    var recorder: AVAudioRecorder? = nil

    var isBreathing = false {
        willSet(newBreathing) {
            // Run the callback function only on change
            if isBreathing != newBreathing {
                self.breathFunction(newBreathing)
            }
        }
    }

    var breathFunction: (Bool) -> ()

    init(threshold: Float, breathFunction: @escaping (Bool) -> ()) throws {
        self.threshold = threshold
        self.breathFunction = breathFunction

        super.init()

        try self.setupAudioRecorder()
    }

    func setupAudioRecorder() throws {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.record)
        try AVAudioSession.sharedInstance().setActive(true)

        let url = NSURL.fileURL(withPath: NSTemporaryDirectory()).appendingPathComponent("tmpSound")

        var settings = [String: AnyObject]()
        settings[AVSampleRateKey] = 44100.0 as AnyObject
        settings[AVFormatIDKey] = Int(kAudioFormatAppleLossless) as AnyObject
        settings[AVNumberOfChannelsKey] = 1 as AnyObject
        settings[AVEncoderAudioQualityKey] = AVAudioQuality.max.rawValue as AnyObject

        try recorder = AVAudioRecorder(url: url, settings: settings)
        recorder?.prepareToRecord()
        recorder?.isMeteringEnabled = true
        recorder?.record()

        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: Selector(("tick")), userInfo: nil, repeats: true)
    }

    func tick() {
        if let recorder = recorder {
            recorder.updateMeters()

            // Uses a weighted average of the average power and peak power for the time period.
            let average = recorder.averagePower(forChannel: 0) * 0.4
            let peak = recorder.peakPower(forChannel: 0) * 0.6
            let combinedPower = average + peak

            isBreathing = (combinedPower > threshold)
        }
    }
}
