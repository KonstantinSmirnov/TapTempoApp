//
//  ViewController.swift
//  TapTempoApp
//
//  Created by Konstantin Smirnov on 24.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempoLabel: UILabel!
    
    var delegate: CanCalculateTempo?
    var model = TapModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = model
    }

    @IBAction func tapButtonPressed(_ sender: UIButton) {
        self.delegate?.calculateTempo()
        updateBPMLabel()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.delegate?.reset()
        tempoLabel.text = "0"
    }
    
    func updateBPMLabel() {
        tempoLabel.text = self.delegate?.getBPM()
    }
}

