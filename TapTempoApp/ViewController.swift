//
//  ViewController.swift
//  TapTempoApp
//
//  Created by Konstantin Smirnov on 24.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempoLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    var delegate: CanCalculateTempo?
    var model = TapModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = model
        updateBPMLabel()
        
        tapButton.layer.borderWidth = 2
        tapButton.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        tapButton.layer.cornerRadius = 0.5 * tapButton.bounds.size.width
        tapButton.clipsToBounds = true
        
    }

    @IBAction func tapButtonPressed(_ sender: UIButton) {
        self.delegate?.calculateTempo()
        updateBPMLabel()
        
        // Update button opacity
        sender.alpha = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
              //Bring's sender's opacity back up to fully opaque.
              sender.alpha = 1.0
          }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.delegate?.reset()
        updateBPMLabel()
    }
    
    func updateBPMLabel() {
        tempoLabel.text = self.delegate?.getBPM()
    }

}

