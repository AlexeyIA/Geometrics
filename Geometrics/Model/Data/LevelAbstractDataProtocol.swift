


protocol LevelAbstractDataProtocol {
    
    func getDifficulty() -> LevelData.Difficulty
    func getPlacementInfo() -> LevelData.PlacementInfo
    func getPossibleForms() -> [LevelData.Forms]
    func getPossibleColors() -> [LevelData.Colors]
    
}
