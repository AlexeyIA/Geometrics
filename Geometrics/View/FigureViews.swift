//
//  FigureView.swift
//  Geometrics
//
//  Created by Alexey A on 03.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class FigureViews {
    
    func getClosedFigureViews(data: [FigureData]) -> [UILabel] {
        
        var fViews = [UILabel]()
        
        for figureData in data {
            
            let rect = Transform.figureDataToRect(data: figureData)
            
            let label = UILabel(frame: rect)
            
            label.backgroundColor = .darkGray
            
            fViews.append(label)
        }
        
        return fViews
    }

}
