


class LevelNormalData: LevelAbstractDataProtocol {
    
    func getDifficulty() -> LevelData.Difficulty {
        return .normal
    }
     
    func getPlacementInfo() -> LevelData.PlacementInfo {
        return LevelData.PlacementInfo(onX: 4, onY: 5)
    }
    
    func getPossibleForms() -> [LevelData.Forms] {
        return [.triangle, .square]
    }
       
    func getPossibleColors() -> [LevelData.Colors] {
        return [.blue, .green]
    }
}
