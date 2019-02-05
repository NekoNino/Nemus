//
//  MainGameViewController.swift
//  Nemus Apocalypse
//
//  Created by Minh Nilsson on 2018-08-31.
//  Copyright © 2018 Minh Nilsson. All rights reserved.
//

import UIKit
import AVFoundation


struct Stage: Codable {
    var bgImage:String?
    var text:String
    let choice:[Choice]
}

struct Choice: Codable {
    var text:String
    var nextStage:Int
    
}


class MainGameViewController: UIViewController {
    
    
    var stages: [Stage] = []
    var currentStage: Stage?
    // [stage0, stage1, stage2, stage3 ....]
    
    //loadStage(stages[ currentStage.choices[buttonClicked].nextStage ])

    @IBOutlet weak var imageView: UIImageView!
    // MARK: - Outlets
    @IBOutlet weak var text: UITextView!
    
    
    //Button 1
    @IBOutlet weak var choiceA: UIButton!
    
    //Button 2
    @IBOutlet weak var choiceB: UIButton!
    
    //Button 3
    @IBOutlet weak var choiceC: UIButton!
    
    
    // hide buttons
    private func hideAllButtons() {
        choiceA.isHidden = true
        choiceB.isHidden = true
        choiceC.isHidden = true
    }
    
    // show buttons
    private func showAllButtons() {
        choiceA.isHidden = false
        choiceB.isHidden = false
        choiceC.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //        testText.text = "Write you name"
        //   print("Show text")
        
    
        choiceA.setTitle("Choice A", for: .normal)
        choiceA.layer.cornerRadius = 16
        
        
        
        choiceB.setTitle("Choice B", for: .normal)
        choiceB.layer.cornerRadius = 16
    
        
        
        choiceC.setTitle("Choice C", for: .normal)
        choiceC.layer.cornerRadius = 16
        
    
        /*
        
        
        var stage0 = Stage(bgImage: "cloud", text:
            "stage 1 test."
            ,
                           
                           choice: [
//                            Choice(text:"None", nextStage: 1),
                            
//                            Choice(text:"None", nextStage: 2),
                            
                            Choice(text:"Next", nextStage: 1)
                            
            ])
        
 */
        if let path = Bundle.main.path(forResource: "stage_data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                stages = try jsonDecoder.decode([Stage].self, from: data)
            } catch let error{
                // handle error
                print(error.localizedDescription)
                // could not parse json, will crash
            }
        } else {
            // could not read data file, do something
        }
        
        if stages.count > 0 {
            loadStage(stageNumber: 0)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if stages.count <= 0 {
            //performSegue(withIdentifier: "segueToMainMenu", sender: nil)
            dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadStage(stageNumber: Int) {
        if stageNumber < 0 || stageNumber >= stages.count {
            dismiss(animated: true, completion: nil)
            return
        }
        let stage:Stage = stages[stageNumber]
        print("Loaded stage \(stageNumber)")

        hideAllButtons()
        currentStage = stage
        text.text = stage.text
        if let image = stage.bgImage {
            imageView.image = UIImage(named: image)
        } else {
            imageView.image = nil
        }
        if stage.choice.count == 3 {
            choiceA.setTitle(stage.choice[0].text, for: .normal)
            choiceB.setTitle(stage.choice[1].text, for: .normal)
            choiceC.setTitle(stage.choice[2].text, for: .normal)
            showAllButtons()
        } else if stage.choice.count == 2 {
            choiceA.setTitle(stage.choice[0].text, for: .normal)
            choiceB.setTitle(stage.choice[1].text, for: .normal)
            choiceA.isHidden = false
            choiceB.isHidden = false
        } else if stage.choice.count == 1 {
            choiceA.setTitle(stage.choice[0].text, for: .normal)
            choiceA.isHidden = false
        } else {
            // No choices, show "next"?
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Actions
    
    @IBAction func choiceAPress(_ sender: UIButton) {
        print("Button A pressed")
        
        if let nextStageNumber: Int  = currentStage?.choice[0].nextStage {
            loadStage(stageNumber: nextStageNumber)
        }
    }
    
   @IBAction func choiceBPress(_ sender: UIButton) {
        print("Button B pressed")
    
        if let nextStageNumber: Int  = currentStage?.choice[1].nextStage {
            loadStage(stageNumber: nextStageNumber)
        }
    }
    
    
    @IBAction func choiceCPress(_ sender: UIButton) {
        print("Button C pressed")
        
        if let nextStageNumber: Int  = currentStage?.choice[2].nextStage {
            loadStage(stageNumber: nextStageNumber)
        }
    }

    /*
    func loadState(stageDescription stgDesc: String, choiceAText: String, choiceBText: String, choiceCText: String) {
        text.text = stgDesc
        choiceA.setTitle(choiceAText, for: .normal)
        choiceB.setTitle(choiceBText, for: .normal)
        choiceC.setTitle(choiceCText, for: .normal)

    }
 */
    
    //Hide status bar in full screen
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
