//
//  SetFigureData.swift
//  Geometrics
//
//  Created by Alexey A on 07.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation

class FigureDataLogic {
    
    static var share = FigureDataLogic()
    
    private var selectedFigureForm = LevelData.Forms.closed
    private var selectedFigureColor = LevelData.Colors.closed
    
    private var figureData = [FigureData]()
    
    func setSelectedFigure(level: Level) {
        selectedFigureForm = level.getPossibleForms().randomElement()!
        selectedFigureColor = level.getPossibleColors().randomElement()!
    }
    
    func setFigureData(level: Level) {
        
        var figureData = [FigureData]()
        
        for _ in 1...4 {
            let figure = FigureData(f: selectedFigureForm, c: selectedFigureColor)
            figureData.append(figure)
        }
        
        let getNumOfFigures = { () -> Int in
            let x = level.getPlacementInfo().onX
            let y = level.getPlacementInfo().onY
            return x*y
        }
        
        for _ in 5...getNumOfFigures() {
            let f = level.getPossibleForms().randomElement()!
            let c = level.getPossibleColors().randomElement()!
            let figure = FigureData(f: f, c: c)
            figureData.append(figure)
        }
        
        let selected = figureData.first
        
        figureData.shuffle()
        
        figureData[0] = selected!
        
        self.figureData = figureData
    }
    
    func getData() -> [FigureData] {
        return self.figureData
    }
    
    
    private init() {}
}
