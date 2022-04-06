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
    
    private var figureViews = FigureViews()

    @IBAction func startButton(_ sender: Any) {
        
        FieldData.share.setFieldFrame(frame: self.view.frame)

    }
}


extension GameController: DrawFiguresProtocol {

    func setFigureFrames() {
        
        logic.placements.setFigureFrames(toLevel: level)
    }
}







