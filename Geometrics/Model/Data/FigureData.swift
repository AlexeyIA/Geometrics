//
//  FigureData.swift
//  Geometrics
//
//  Created by Alexey A on 11.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

class FigureData {
    
    private var figureForm: LevelData.Forms?
    private var figureColor: LevelData.Colors?
    
    init(f: LevelData.Forms, c: LevelData.Colors) {

        figureForm = f

        figureColor = c
     }
    
    func getData() -> (LevelData.Forms, LevelData.Colors) {
        
        return (figureForm!, figureColor!)
    }
    
    
}
