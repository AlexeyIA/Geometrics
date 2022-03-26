//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class PlacementsLogic {
    
    func calcFigureSize(placements: LevelData.PlacementInfo, width: Double) -> [FigureData]? {
        
        var figureWidth: Double
        
        if let onX = placements.onX {
            
            let spaces = FieldData.share.borderPercent * width
            
            figureWidth = (width - spaces*(onX+1))/onX
 
        }
        return nil
    }
    
}

