//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//
import CoreGraphics

class PlacementsLogic {
        
    func setFigureFrames(toLevel level: Level) {
    
        let fieldFrame = FieldData.share.getFieldFrame()
        
        let fieldWidth = Double(fieldFrame.width)
        
        let fieldHeight = Double(fieldFrame.height)
      
        let border = getBorder(viewLength: fieldWidth)
        
        let onX = level.getPlacementInfo().onX
        
        let onY = level.getPlacementInfo().onY
        
        let spacesLength = border * (Double(onX) + 1)
        
        let figureWidth = ( fieldWidth - spacesLength ) / Double(onX)
            
        var figureFrames = [CGRect]()
        
        var currentY = fieldHeight - border
        
        for _ in 1...onY {
            
            var currentX = border
            
            currentY = currentY - border - figureWidth
            
            for _ in 1...onX {
                
                let figureData = CGRect(x: currentX, y: currentY, width: figureWidth, height: fieldWidth)
                
                figureFrames.append(figureData)
                
                currentX = currentX + border + figureWidth
            }
        }
        
        FieldData.share.setFigureFrames(frames: figureFrames)
    }
    
    
    private func getBorder(viewLength l: Double) -> Double {
        return FieldData.share.borderPercent * l
    }

}


