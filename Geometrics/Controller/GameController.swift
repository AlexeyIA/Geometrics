//
//  GameController.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//
import UIKit

class GameController: UIViewController {
    
    private var level = Level(difficulty: .easy)
    
    private var logic = Logic()
    
    private var figureView = [FigureView]()
    private var figureData = [FigureData]()
    
    private var selectedFigureView: FigureView?
    private var selectedFigureData: FigureData?
    
    private var openFigureData: FigureData?
    
    override func viewDidLoad() {
        
        FieldData.share.setField(main: self.view.frame)
        
        logic.controller = self
    }

    @IBAction func startButton(_ sender: Any) {
        
        if figureData.isEmpty {
        
            logic.gameState.setState(to: .setFigureData)
            
            logic.play(inLevel: level)
        
        }
            
    }
    
    func setFigureData(data: [FigureData]) {
        
        figureData = data
        
        selectedFigureData = figureData.first
        
        logic.gameState.setState(to: .setFigureViews)
        
        logic.play(inLevel: level)
    }

    func setFigureViews(views: (FigureView, [FigureView])) {
        
        let selected = views.0
        
        let figures = views.1
        
        selectedFigureView = selected.setShape(data: selectedFigureData!)
        
        for i in 0..<figures.count {
            
            figures[i].controller = self
                        
            figureView.append(figures[i].setShape(data: figureData[i]))
            
            self.view.addSubview(figures[i])
        }
        
        logic.gameState.setState(to: .closeFigures)
        
        logic.play(inLevel: level)
    }
    
    func setOpenFigureData(data: FigureData) {
        
        openFigureData = data
        
        print(openFigureData!.getData())

    }
    
    func closeFigures() {
        
        self.view.addSubview(selectedFigureView!)
        
        for figure in figureView {
            figure.close()
        }
        
    }

}










