


class Level {
    
    private var levelData: LevelAbstractDataProtocol
    
    init(difficulty: LevelData.Difficulty) {
        
        switch difficulty {
        case .easy:
            levelData = LevelEasyData()
        case .normal:
            levelData = LevelNormalData()
        }
    }
}

extension Level: LevelAbstractDataProtocol {
    
    func getDifficulty() -> LevelData.Difficulty {
        levelData.getDifficulty()
    }
    
    func getPlacementInfo() -> LevelData.PlacementInfo {
        levelData.getPlacementInfo()
    }
    
    func getPossibleForms() -> [LevelData.Forms] {
        levelData.getPossibleForms()
    }
    
    func getPossibleColors() -> [LevelData.Colors] {
        levelData.getPossibleColors()
    }
}



