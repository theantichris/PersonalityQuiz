//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Christopher Lamm on 12/18/23.
//

import UIKit

class QuestionViewController: UIViewController {

    var questions: [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle),
            ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
            Answer(text: "Eating", type: .dog),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Swimming", type: .turtle),
            ]
        ),
        Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
            Answer(text: "I love them", type: .dog),
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            ]
        ),
    ]
    
    var questionIndex = 0
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleAnswerStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleAnswerStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    
    @IBOutlet var rangedAnswerStackView: UIStackView!
    @IBOutlet var rangedLable1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        singleAnswerStackView.isHidden = true
        multipleAnswerStackView.isHidden = true
        rangedAnswerStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleSack(using: currentAnswers)
        case.ranged:
            rangedAnswerStackView.isHidden = false
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleAnswerStackView.isHidden = false
        
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleSack(using answers: [Answer]) {
        multipleAnswerStackView.isHidden = false
        
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
