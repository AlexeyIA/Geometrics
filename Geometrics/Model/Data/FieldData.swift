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
    
    let borderPercent: Double = 0.05
    
    private var fieldFrame = CGRect()
    
    func setFieldFrame(frame: CGRect) {
        self.fieldFrame = frame
    }
    func getFieldFrame() -> CGRect {
        return fieldFrame
    }
    
    private var figureFrames = [CGRect]()
    
    func setFigureFrames(frames: [CGRect]) {
        figureFrames = frames
    }
    func getFigureFrames() -> [CGRect] {
        return figureFrames
    }

    private init() {}
    
}
