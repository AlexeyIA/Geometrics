//
//  FigureView.swift
//  Geometrics
//
//  Created by Alexey A on 03.04.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import UIKit

class FigureView: UILabel {
    
    weak var controller: GameController?
    
    private var data: FigureData?
    
    @discardableResult
    func setShape(data: FigureData) -> FigureView {
       
        setForm(form: data.getData().0)
       
        setColor(color: data.getData().1)
        
        self.data = data
        
        return self
    }
    
    func setFigureTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.getData))
        
        self.isUserInteractionEnabled = true
        
        self.addGestureRecognizer(labelTap)
        
    }
    
    @objc func getData() {
        
        open()
        
        self.isUserInteractionEnabled = false
        
        if let data = self.data {
            
            controller?.setOpenFigureData(data: data)
            
        }
    }
    
    
    func close() {
        setForm(form: .closed)
        setColor(color: .closed)
        setFigureTap()
    }
    
    func open() {
        setForm(form: data!.getData().0)
        setColor(color: data!.getData().1)
    }
    
    private func setForm(form: LevelData.Forms) {
        
        let mask = CAShapeLayer()
        
        mask.frame = self.layer.bounds
        let width = self.frame.width
        let height = self.frame.height
        let path = CGMutablePath()
        
        switch form {
            
        case .circle, .closed:
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
        }
        
        self.layer.mask = mask
    }
    
    private func setColor (color: LevelData.Colors) {
        switch color {
        case .blue:
            self.backgroundColor = .blue
        case .green:
            self.backgroundColor = .green
        case .closed:
            self.backgroundColor = .darkGray
        default:
            break
        }
    }
    
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
