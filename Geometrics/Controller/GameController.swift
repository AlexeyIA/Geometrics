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
    private var figureDatas = [FigureData]()
    
    override func viewDidLoad() {
        FieldData.share.setFieldFrame(frame: self.view.frame)
        logic.controller = self
    }

    @IBAction func startButton(_ sender: Any) {
        
        if logic.gameplay.getState() == .start {
            
            logic.placements.setFigureFrames(toLevel: level)
        
            logic.gameplay.setState(to: .setFigureData)
            
            logic.play(inLevel: level)
        }
    }
    
    func setFigureData(data: [FigureData]) {
        for figureData in data {
            figureDatas.append(figureData)
        }
        logic.gameplay.setState(to: .setFigureViews)
        logic.play(inLevel: level)
    }
    
    func setFigureViews() {
        
        for i in 0..<figureDatas.count {
            let rect = FieldData.share.getFigureFrames()[i]
            let view = FigureView(frame: rect)
            view.setView(data: figureDatas[i])
            figureViews.append(view)
            self.view.addSubview(view)
        }
        
    }
    
}










