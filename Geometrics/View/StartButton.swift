//
//  StartButton.swift
//  Geometrics
//
//  Created by Alexey A on 19.05.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class StartButton: UIButton {
    
    private var width: CGFloat = 100.0
    private var height: CGFloat = 30.0
    
    
    func setFrame(main: CGRect) {
        
        let figureFrame = FieldData.share.getFigureFrames(forLevel: Level(difficulty: .easy)).0
        
        let yCoordinate = figureFrame.origin.y + figureFrame.height/2 - height/2
        
        width = figureFrame.width * 2
        
        let xCoordinate = main.midX - width/2
        
        self.frame = CGRect(x: xCoordinate, y: yCoordinate, width: width, height: height)
        
        addTitle()
        
    }
    
    
    func addTitle() {
        
        self.setTitle("START", for: .normal)
        
        self.setTitleColor(.darkGray, for: .normal)
        
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
    }
    
}
