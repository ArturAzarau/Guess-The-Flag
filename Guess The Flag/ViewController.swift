//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Артур Азаров on 22.06.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import GameplayKit

final class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var topButton: UIButton!
    @IBOutlet var middleButton: UIButton!
    @IBOutlet var bottomButton: UIButton!
    
    // MARK: - Actions
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
    }
    
    // MARK: - Properties
    
    private var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland",
                             "russia", "spain", "uk", "us"]
    private var score = 0
    private var correctAnswer = 0
    
    // MARK: - Object life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askQuestion()
    }

    // MARK: - Methods
    
    private func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        
        topButton.setImage(UIImage(named: countries[0]), for: .normal)
        middleButton.setImage(UIImage(named: countries[1]), for: .normal)
        bottomButton.setImage(UIImage(named: countries[2]), for: .normal)
    }


}

