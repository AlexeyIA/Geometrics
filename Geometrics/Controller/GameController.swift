//
//  GameController.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//
import UIKit

class GameController: UIViewController {
    
    private var level = Level(difficulty: .easy)
    
    private var logic = Logic()
    
    private var figureViews = [FigureView]()
    
    override func viewDidLoad() {
        FieldData.share.setFieldFrame(frame: self.view.frame)
    }

    @IBAction func startButton(_ sender: Any) {
        
        if logic.gameplay.getState() == .start {
            
            logic.placements.setFigureFrames(toLevel: level)
        
            logic.gameplay.setState(to: .setFigureData)
            
            logic.play(inLevel: level)
        }
    }
}










