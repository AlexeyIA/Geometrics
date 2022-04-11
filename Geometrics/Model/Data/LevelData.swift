


class LevelData {

    enum Difficulty {
        case easy, normal
    }

    struct PlacementInfo {
        //how many figures on field width(onX), height(onY)
        let onX: Int
        let onY: Int
    }

    enum Forms: CaseIterable {
        case circle, square, triangle, closed
    }

    enum Colors: CaseIterable {
        case blue, green, lightGreen, closed
    }
    
}





