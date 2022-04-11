//
//  Transform.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class Transform {
    
    private init() {}
   
    func hexStringToUIColor (hexValue hex:String) -> UIColor {
        
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray // error color
        }
        
        var rgbValue: UInt32 = 0
        
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}


 
    
    /*
    @objc func closeImages() {
        
        for i in figures {

            let closeFigure = UILabel(frame: i.frame)
            
            closeFigure.backgroundColor = hexStringToUIColor(hex: "#d5d5ea")
            
            let mask = CAShapeLayer()
            
            mask.frame = i.layer.bounds
            
            let width = i.layer.frame.width
            
            let height = i.layer.frame.height
            
            let path = CGMutablePath()
            
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            
            mask.path = path
            
            closeFigure.layer.mask = mask
            
            closeFigures.append(closeFigure)
         
            i.isEnabled = true
        }
 
    */
    
    
    /*
    
    func displayNext (i: Int, form: String, color: String) {
   
            nextFigure.backgroundColor = hexStringToUIColor(hex: "#d5d5ea")
            
            let mask = CAShapeLayer()
            
            mask.frame = nextFigure.layer.bounds
            
            let width = nextFigure.layer.frame.width
            
            let height = nextFigure.layer.frame.height
            
            let path = CGMutablePath()
            
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            
            mask.path = path
            
            nextFigure.layer.mask = mask
        
    }
    */
 
 
    
    
/*
    func touchAct (_ touch: AnyObject) {
       
        let position = touch.location(in: super.view)
        
        for i in figures {
        
            if i.frame.contains(position) && i.isEnabled == true {
            
                 play(i)
            }
        }
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
    
            touchAct(touch)
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for touch : AnyObject in touches {
        
            touchAct(touch)
        }
    }
 */
