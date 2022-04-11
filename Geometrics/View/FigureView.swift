//
//  FigureView.swift
//  Geometrics
//
//  Created by Alexey A on 03.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class FigureView: UILabel {

    func setView(data: FigureData) {
        
        let mask = CAShapeLayer()
        
        mask.frame = self.layer.bounds
        let width = self.frame.width
        let height = self.frame.height
        let path = CGMutablePath()
        
        self.backgroundColor = .black
        
        switch data.getData().0 {
            
        case .circle:
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            mask.path = path
        
        case .square:
            path.move(to: CGPoint(x: 0.0, y: 0.0))
            path.addLine(to: CGPoint(x: width, y: 0.0))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0.0, y: height))
            mask.path = path
        
        case .triangle:
            path.move(to: CGPoint(x: 0.0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width/2, y: 0.0))
            path.addLine(to: CGPoint(x: 0.0, y: height))
            mask.path = path
        
        default:
            break
        }
        
        self.layer.mask = mask
    }
    
    private func getColor() -> UIColor {
        return .black
    }
    
}
