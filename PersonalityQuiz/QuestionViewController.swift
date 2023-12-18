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
    
    @IBOutlet var singleAnswerStackView: UIStackView!
    @IBOutlet var multipleAnswerStackView: UIStackView!
    @IBOutlet var rangedAnswerStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        singleAnswerStackView.isHidden = true
        multipleAnswerStackView.isHidden = true
        rangedAnswerStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleAnswerStackView.isHidden = false
        case .multiple:
            multipleAnswerStackView.isHidden = false
        case.ranged:
            rangedAnswerStackView.isHidden = false
        }
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
