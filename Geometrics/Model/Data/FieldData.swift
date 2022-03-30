//
//  Field.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class FieldData {
    
    static var share = FieldData()
    
    // percent of main view
    let widthPercent: Double = 0.9
    let heightPercent: Double = 0.6
    
    let borderPercent: Double = 0.05
   
    private init() {}
    
}
