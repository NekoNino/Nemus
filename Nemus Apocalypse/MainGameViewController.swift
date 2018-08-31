//
//  MainGameViewController.swift
//  Nemus Apocalypse
//
//  Created by Minh Nilsson on 2018-08-31.
//  Copyright © 2018 Minh Nilsson. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {

    ///MARK: - Outlets
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
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    ///MARK: - Actions
    
    @IBAction func choiceAPress(_ sender: UIButton) {
        print("Button A pressed")
        loadState(stageDescription: "Choice A pressed!", choiceAText: "Choice A 2", choiceBText: "Choice B 2", choiceCText: "Choice C 2")
    }
    
    @IBAction func choiceBPress(_ sender: UIButton) {
        text.text = "Button B pressed"
        choiceA.setTitle("Choice A 3", for: .normal)
        choiceB.setTitle("Choice B 3", for: .normal)
        choiceC.setTitle("Choice C 3", for: .normal)
        print("Button B pressed")
    }
    @IBAction func choiceCPress(_ sender: UIButton) {
        print("Button C pressed")
    }
    
    func loadState(stageDescription stgDesc: String, choiceAText: String, choiceBText: String, choiceCText: String) {
        text.text = stgDesc
        choiceA.setTitle(choiceAText, for: .normal)
        choiceB.setTitle(choiceBText, for: .normal)
        choiceC.setTitle(choiceCText, for: .normal)

    }
    
}
