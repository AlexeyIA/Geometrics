


class LevelEasyData: LevelAbstractDataProtocol {
    
    func getDifficulty() -> LevelData.Difficulty {
        return .easy
    }
  
    func getPlacementInfo() -> LevelData.PlacementInfo {
        return LevelData.PlacementInfo(onX: 4, onY: 4)
    }
    
    func getPossibleForms() -> [LevelData.Forms] {
        return [.triangle, .square]
    }
    
    func getPossibleColors() -> [LevelData.Colors] {
        return [.green]
    }
    
    
}
