//
//  ViewController.swift
//  Quiz
//
//  Created by Kartal Emre Buruk on 19.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var optionBButton: UIButton!
    @IBOutlet weak var optionCButton: UIButton!
    @IBOutlet weak var optionDButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    var done = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        let correctAnswer = quizBrain.checkAnswer(a: sender.tag)
        if correctAnswer
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        if done
        {
            let s = quizBrain.getScore()
            scoreLabel.text = "Score: \(s)"
            let alert = UIAlertController(title: "Quiz Finished!", message: "Your score: \(s). Reset the game.",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                          handler: {action in self.resetUI()}))
            self.present(alert, animated: true)
        }
        else
        {
            Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(setupUI), userInfo: nil, repeats: false)
        }
    }
    
    func resetUI()
    {
        quizBrain.reset()
        done = false
        setupUI()
    }

    @objc func setupUI()
    {
        optionAButton.backgroundColor = UIColor.clear
        optionBButton.backgroundColor = UIColor.clear
        optionCButton.backgroundColor = UIColor.clear
        optionDButton.backgroundColor = UIColor.clear

        let q = quizBrain.getQuestion()
        questionLabel.text = q.question
        optionAButton.setTitle(q.options[0], for: .normal)
        optionBButton.setTitle(q.options[1], for: .normal)
        optionCButton.setTitle(q.options[2], for: .normal)
        optionDButton.setTitle(q.options[3], for: .normal)
        
        let s = quizBrain.getScore()
        scoreLabel.text = "Score: \(s)"
        
        let p = quizBrain.getPercentage()
        progressBar.progress = p
    
        if p == 1
        {
            done = true
        }
    }
}
