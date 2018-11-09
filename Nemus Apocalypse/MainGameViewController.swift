//
//  MainGameViewController.swift
//  Nemus Apocalypse
//
//  Created by Minh Nilsson on 2018-08-31.
//  Copyright © 2018 Minh Nilsson. All rights reserved.
//

import UIKit
import AVFoundation


struct Stage {
    var bgImage:String
    var text:String
    let choice:[Choice]
}

struct Choice {
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
    }
    
    // show buttons
    private func showAllButtons() {
        choiceA.isHidden = false
        choiceB.isHidden = false
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
        
    
        
        
        
        var stage0 = Stage(bgImage: "cloud", text:
            "Staden Nemus är en helt vanlig stad med många människor, alla levde gött tills en dag."
            ,
                           
                           choice: [
                            Choice(text:"Choice 1", nextStage: 1),
                            
                            Choice(text:"Choice 2", nextStage: 2),
                            
                            Choice(text:"Next", nextStage: 1)
                            
            ])
        
        
        var stage1 = Stage(bgImage: "cloud", text:
            "En helt okänd virus smittade staden och alla fruktade alla och djur."
            ,
                           choice: [
                            Choice(text:"", nextStage: 0),
                            
                            
                            Choice(text:"", nextStage: 1),
                            
                            Choice(text:"Next", nextStage: 2),
                            
                            ])
        
        var stage2 = Stage(bgImage: "cloud", text: "bjnsjsfnkfnkj",
                           choice: [
                            Choice(text:"", nextStage: 1),
                            Choice(text:"", nextStage: 2),
                            Choice(text:"Next", nextStage: 3)
            ])
        
        var stage3 = Stage(bgImage: "cloud", text: "jndsjngsgfj",
                           choice: [
                            Choice(text:"", nextStage: 2),
                            Choice(text:"", nextStage: 3),
                            Choice(text:"Next", nextStage: 4)
            ])
        
        var stage4 = Stage(bgImage: "cloud", text: "dsnfjsnfjnfndjnfk",
                           choice: [
                            Choice(text: "", nextStage: 3),
                            Choice(text: "", nextStage: 4),
                            Choice(text: "Next", nextStage: 5)
            ])
        
        var stage5 = Stage(bgImage: "cloud", text: "hdbajahkddjfkdkdkdk",
                           choice: [
          
                            Choice(text: "", nextStage: 4),
                            Choice(text: "", nextStage: 5),
                            Choice(text: "Next", nextStage: 5),
                            
            
            ])
        
        
        
        stages.append(stage0)
        stages.append(stage1)
        stages.append(stage2)
        stages.append(stage3)
        stages.append(stage4)
        stages.append(stage5)

        loadStage(stage: stages[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadStage(stage:Stage) {
        currentStage = stage
        text.text = stage.text
        imageView.image = UIImage(named: stage.bgImage)
        choiceA.setTitle(stage.choice[0].text, for: .normal)
        choiceB.setTitle(stage.choice[1].text, for: .normal)
        choiceC.setTitle(stage.choice[2].text, for: .normal)
        
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
        
        if var nextStageNumber: Int  = currentStage?.choice[0].nextStage {
        var nextStage:Stage = stages[nextStageNumber]
            
            
        loadStage(stage: nextStage)
        }
    }
    
   @IBAction func choiceBPress(_ sender: UIButton) {
        print("Button B pressed")
    
    if var nextStageNumber: Int = currentStage?.choice[1].nextStage {
        var nextStage:Stage = stages[nextStageNumber]
        
        
        loadStage(stage: nextStage)
        
        }
    
    }
    
    
    @IBAction func choiceCPress(_ sender: UIButton) {
        print("Button C pressed")
        
        if var nextStageNumber: Int = currentStage?.choice[2].nextStage {
            var nextStage:Stage = stages[nextStageNumber]
            
            
            
            loadStage(stage: nextStage)
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
