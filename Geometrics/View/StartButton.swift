//
//  StartButton.swift
//  Geometrics
//
//  Created by Alexey A on 19.05.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class StartButton: UIButton {
    
    
    func setFrame() {
        
        self.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 30.0)
        
        self.setTitle("START", for: .normal)
        
        self.backgroundColor = .blue
    }
    
}
