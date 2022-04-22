//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

class Logic {
    
    weak var controller: GameController?
        
    let gameState = GameState()
    
    func play(inLevel lvl: Level) {
        
        switch gameState.getState() {
        
        case .setFigureData:
            
            setFigureData(level: lvl)
            
        case .setFigureViews:
            
            setFigureViews(level: lvl)
            
        case .closeFigures:
            
            _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(closeFigures), userInfo: nil, repeats: false)
            
        default:
            break
        }
    }
    
    private func setFigureData(level: Level) {
        
        FigureDataLogic.share.setSelectedFigure(level: level)
                   
        FigureDataLogic.share.setFigureData(level: level)
                   
        controller!.setFigureData(data: FigureDataLogic.share.getData())
    }
    
    private func setFigureViews(level: Level) {
        
        let frames = FieldData.share.getFigureFrames(forLevel: level)
                   
        let selected = FigureView(frame: frames.0)
                   
        var views = [FigureView]()
                   
        for frame in frames.1 {
                       
            views.append(FigureView(frame: frame))
        }
                   
        controller!.setFigureViews(views: (selected, views))
    }
    
    @objc private func closeFigures() {
        controller!.closeFigures()
    }
    
    
    
    
}

