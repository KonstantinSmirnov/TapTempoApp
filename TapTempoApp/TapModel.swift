//
//  TapModel.swift
//  TapTempoApp
//
//  Created by Konstantin Smirnov on 24.01.2021.
//

protocol CanCalculateTempo {
    func calculateTempo()
    func reset()
    func getBPM() -> String
}

import Foundation

class TapModel: CanCalculateTempo {
    
    private var timer = Timer()
    private var milliseconds: Int = 0
    private var bpm: Double = 0
    private var msResultsArray: Array<Int> = []
    
    func calculateTempo() {
        if timer.isValid == true {
            addResultToArray(result: milliseconds)
            milliseconds = 0
        } else {
            print("Started")
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(math), userInfo: nil, repeats: true)
        }
    }
    
    @objc func math() {
        if milliseconds < 1000 {
            milliseconds += 1
        } else {
            reset()
        }
    }
    
    func reset() {
        timer.invalidate()
        milliseconds = 0
        msResultsArray = []
        print("Reset done")
    }
    
    func getBPM() -> String {
        // Need to convert miliseconds to BPM
        if msResultsArray.count > 0 {
            bpm = 60000.00 / Double(msResultsArray.reduce(0, +)/msResultsArray.count)
        }
           
        return String(format: "%.0f", bpm)
    }
    
    func addResultToArray(result: Int) {
        msResultsArray.append(milliseconds)
        // always 3 results max
        if msResultsArray.count > 2 {
            msResultsArray = msResultsArray.suffix(3)
        }
    }
}
