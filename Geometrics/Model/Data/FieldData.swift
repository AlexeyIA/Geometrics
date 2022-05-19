//
//  Field.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//
import CoreGraphics

class FieldData {
    
    static var share = FieldData()
    
    private let borderPercent: Double = 0.05
    
    // base field 4x4
    private let (onX, onY) = (4, 4)
    
    // all (4x6), onY = 6 - for selected on 4x5 lvl
    private var frames = [CGRect]()
    
    
    func setField(main frame: CGRect) {
        
        let fieldWidth = Double(frame.width)
            
        let fieldHeight = Double(frame.height)
          
        let border = borderPercent * fieldWidth
        
        let spacesLength = border * (Double(onX) + 1)
            
        let figureWidth = ( fieldWidth - spacesLength ) / Double(onX)
                
        var currentY = fieldHeight - border
            
        for _ in 1...(onY+2) {
                
            var currentX = border
                
            currentY = currentY - border - figureWidth
                
            for _ in 1...onX {
                    
                let figureFrame = CGRect(x: currentX, y: currentY, width: figureWidth, height: figureWidth)
                    
                frames.append(figureFrame)
                    
                currentX = currentX + border + figureWidth
            }
        }
    }
    
    // ------------------------------------------> (select, [figures])
    func getFigureFrames(forLevel level: Level) -> (CGRect, [CGRect]) {
        
        var figureFrames = [CGRect]()
        
        let num = onX * onY
        
        for i in 0..<num {
            figureFrames.append(frames[i])
        }
        
        var index = figureFrames.count + onX - 1
        
        if level.getDifficulty() == LevelData.Difficulty.normal {
            
            for i in num..<num+onX {
                figureFrames.append(frames[i])
            }
            
            index += onX
        }
        
        return (frames[index], figureFrames)
    }
        
    private init() {}
    
}
