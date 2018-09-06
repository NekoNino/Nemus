//
//  MainGameViewController.swift
//  Nemus Apocalypse
//
//  Created by Minh Nilsson on 2018-08-31.
//  Copyright © 2018 Minh Nilsson. All rights reserved.
//

import UIKit


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
    // [stage0, stage1, stage2....]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        testText.text = "Write you name"
     //   print("Show text")
        
    
        choiceA.setTitle("Choice A", for: .normal)
        choiceB.setTitle("Choice B", for: .normal)
        choiceC.setTitle("Choice C", for: .normal)
        
        var stage0 = Stage(bgImage: "bild", text: "Scenario-text för stage0",
                           choice: [
                            Choice(text:"Choice 1", nextStage: 3),
                            Choice(text:"Choice 2", nextStage: 2),
                            Choice(text:"Choice 3", nextStage: 3)
            ])
        
        var stage1 = Stage(bgImage: "bild", text: "test 2",
                           choice: [
                            Choice(text:"Choice 2-1", nextStage: 0),
                            Choice(text:"Choice 2-2", nextStage: 2),
                            Choice(text:"Choice 2-3", nextStage: 3)
            ])
        
        var stage2 = Stage(bgImage: "bild2", text: "Test 3",
                           choice: [
                            Choice(text:"Choice 3-1", nextStage: 1),
                            Choice(text:"Choice 3-2", nextStage: 2),
                            Choice(text:"Choice 3-3", nextStage: 3)
            ])
        
        var stage3 = Stage(bgImage: "bild", text: "text 4",
                           choice: [
                            Choice(text:"Choice 4-1", nextStage: 1),
                            Choice(text:"Choice 4-2", nextStage: 2),
                            Choice(text:"Choice 4-3", nextStage: 3)
            ])
        
        stages.append(stage0)
        stages.append(stage1)
        stages.append(stage2)
        stages.append(stage3)

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
    }
    @IBAction func choiceCPress(_ sender: UIButton) {
        print("Button C pressed")
    }

    /*
    func loadState(stageDescription stgDesc: String, choiceAText: String, choiceBText: String, choiceCText: String) {
        text.text = stgDesc
        choiceA.setTitle(choiceAText, for: .normal)
        choiceB.setTitle(choiceBText, for: .normal)
        choiceC.setTitle(choiceCText, for: .normal)

    }
 */
}
