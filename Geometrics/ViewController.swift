







import UIKit

class ViewController: UIViewController {

    var userDef = UserDefaults.standard
    
    var showRules = Bool()
    
    var isBlockedByPause = Bool()
    var isBlockedBySlide = Bool()
    
    var timer = Timer()
    var closeTimer = Timer()
    var gameTimer = Timer ()
    var slideTimer = Timer ()
    
    var figures = [UILabel]()
    var forms = [String]()
    var colors = [String]()
    
    var upFigures = Array(repeating: ("",""), count: 16)
    var downFigures = Array(repeating: ("",""), count: 16)
    
    var subViews = [(UILabel,UILabel)]()
    var subViewsTag = [Int]()
    
    var closeFigures = [UILabel]()
   
    var state = String()
    var lvl = "easy"
    var lvlStage = Int()
    
    var score = 0
    var slideScore = 0
    var countSlide = 0
    var bonusTime = 0
    var bonusLab = UILabel()
    var nextFigure = UILabel()
    var nextFigureLab = UILabel()
    var upNext = UILabel()
    var downNext = UILabel()
    var timeScore = 0
    var highScore = 0
    var gameTime = 0
    var tapCounts = 0
    
    var isClosed = true
    
    var timeToLook = 0.0
    
    var isGroupEnd = false
    
    var tagToCompare : Int = 0
    
    var figureToCompare : (String,String) = ("","")
    
    var slideFigure : (String,String) = ("","")
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var highSoreTime: UILabel!
    @IBOutlet weak var bonusPoints: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var restartOutlet: UIButton!
    @IBOutlet weak var playGameOutlet: UIButton!
    @IBOutlet weak var pauseOutlet: UIButton!
    
    
    var popMenu = UIView()
    var popPlayOut = UIButton()
    var popPlayLab = UILabel()
    var popHowOut = UIButton()
    var popHowLab = UILabel ()
    var popRestartOut = UIButton()
    var popRestartLab = UILabel()
    
    var animMas = [UILabel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if (userDef.value(forKey: "highScore") as? Int) == nil { // == nil
            
            userDef.set(0, forKey: "highScore")
            
            highSoreTime.text = "00:00"
            
            showRules = true
        
        } else {
            
            let entryPoint = userDef.value(forKey: "highScore") as! Int
            
            if entryPoint == 1 {
                
                highSoreTime.text = "00:00"
                
            } else {
            
                highSoreTime.text = scoreToTime(s: (userDef.value(forKey: "highScore") as! Int))
            }
        }
    
        isBlockedByPause = false
       
        playGameOutlet.alpha = 0.0
        topLabel.alpha = 0.0
        highSoreTime.alpha = 0.0
        currentTimeLabel.alpha = 0.0
        currentLabel.alpha = 0.0
        gameTimeLabel.alpha = 0.0
        bonusPoints.alpha = 0.0
        restartOutlet.alpha = 0.0
        pauseOutlet.alpha = 0.0
        
        bonusLab.frame = CGRect(x: super.view.frame.width / 2 + 20, y: gameTimeLabel.frame.origin.y + 45, width: 80, height: 15)
        bonusLab.font = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightThin)
        bonusLab.text = "Points:"
        
        bonusPoints.frame = CGRect(x: super.view.frame.width / 2 + 5, y: gameTimeLabel.frame.origin.y + 45, width: 80, height: 50)
        bonusPoints.font = UIFont.systemFont(ofSize: 39.0, weight: UIFontWeightBold)
        bonusPoints.text = ""
        
        nextFigureLab.frame = CGRect(x: super.view.frame.width / 2 - 60, y: gameTimeLabel.frame.origin.y + 45, width: 50, height: 15)
        nextFigureLab.font = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightThin)
        nextFigureLab.text = "Next:"
        nextFigure.frame = CGRect(x: super.view.frame.width / 2 - 65, y: gameTimeLabel.frame.origin.y + 65, width: 45, height: 45)
        
        upNext.frame = CGRect(x: super.view.frame.width / 2 - 72, y: gameTimeLabel.frame.origin.y + 62, width: 20, height: 20)
        
        downNext.frame = CGRect(x: super.view.frame.width / 2 - 35, y: gameTimeLabel.frame.origin.y + 95, width: 20, height: 20)
        
        if userDef.value(forKey: "highScore") as! Int != 0 {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.openMenu), userInfo: nil, repeats: false)
        } else {
            
                timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.showRules(_:)), userInfo: nil, repeats: false)
        }
    }
    
    
    
    func openMenu() {
        UIView.animate(withDuration: 1.0, animations: {
            self.playGameOutlet.alpha = 1.0
            self.topLabel.alpha = 1.0
            self.highSoreTime.alpha = 1.0
            self.currentTimeLabel.alpha = 1.0
            self.currentLabel.alpha = 1.0
            self.gameTimeLabel.alpha = 1.0
        })
    }
    
    
    
    @IBAction func playGame(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1.0, animations: {
        
            self.backgroundImg.alpha = 0.0
        })
        
        if figures.count != 0 {
            clear()
        }
        
        lvl = "easy"
        
        score = 0
        
        gameTime = 50
        
        gameTimeLabel.text! = scoreToTime(s: gameTime)
        
        currentTimeLabel.text! = scoreToTime(s: score)
        
        isGroupEnd = false
        
        playGameOutlet.isEnabled = false
        
        playGameOutlet.alpha = 0.0
        
        restartOutlet.alpha = 0.0
        
        bonusPoints.alpha = 1.0
        
        pauseOutlet.alpha = 1.0
        
        self.view.addSubview(bonusLab)
        self.view.addSubview(nextFigureLab)
        self.view.addSubview(nextFigure)
        self.view.addSubview(upNext)
        self.view.addSubview(downNext)
       
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {_ in self.generateFigures("easy")})
    }

    
    
    func generateFigures (_ level: String) {
        
        if state != "gameover" {
        
            userDef.set(level, forKey: "lvl")
        
            state = "generate"
        
            var form = [String]()
        
            var color = ["#9999сс","#2c5d9d"]
        
            var onWidth : CGFloat = 4
        
            var onHeight : CGFloat = 4
            
            switch lvl {
            
            case "easy":
            
                onWidth = 2
                
                onHeight = 2
                
                timeToLook = 1.0
                
                form = ["triangle","square"]
            
            case "medium":
                
                timeToLook = 3.0
                
                form = ["triangle","square"]
            
            case "hard":
            
                timeToLook = 7.0
                
                form = ["triangle","square","circle"]
            
            case "ultra":
                
                timeToLook = 10.0
            
                form = ["rect","triangle","square","circle"]
            
            case "slide":
            
                form = ["circle","square","triangle"]
                
                color = ["#2c5d9d","#9999сс","#93d60a"]
            
            default:
                break
            }
            
            switch score {
            
            case 100...199:
               
                color.append("#2c5d9d")
            
            case 200...299:
            
                color.append("#2c5d9d")
                
                color.append("#93d60a")
            
            default:
                break
            }
       
            var onX : CGFloat = 20.0 // start figure position
        
            var dx: CGFloat = 20.0 // distance between figures = dy
        
            if level == "ultra" {
            
                onX = 25.0
            
                dx = 25.0
            }
        
            let width : CGFloat = (super.view.frame.width - 2*dx - (onWidth - 1) * dx )/onWidth
        
            let height : CGFloat = width
        
            var onY : CGFloat = super.view.frame.height - dx - 1.2*height
        
            var k = 0
        
            if !isBlockedByPause { // isBlocked by pause start
       
                // Определение фигур, форм и цветов
        
                let numberFigures = Int(onWidth*onWidth)
        
                var numbers = [Int]()
            
                for i in 0...numberFigures-1 {
                
                    numbers.append(i)
                
                    forms.insert("", at: i)
                
                    colors.insert("", at: i)
                }
        
                switch lvl { // switch lvl start
        
                case "slide":
            
                    let f = arc4random()%UInt32(form.count)
            
                    let c = arc4random()%UInt32(color.count)
            
                    slideFigure.0 = form[Int(f)]
            
                    slideFigure.1 = color[Int(c)] // select random form and color for slideFigure
            
                    countSlide = Int(5 + arc4random()%8) // how many slideFigures in figures
            
                    for _ in 1...countSlide { // add slideFigure to random figures
                
                        let a = arc4random()%UInt32(numbers.count)
                
                        forms[numbers[Int(a)]] = slideFigure.0
                
                        colors[numbers[Int(a)]] = slideFigure.1
                
                        numbers.remove(at: Int(a))
                    }
            
                    for _ in 1...(16-countSlide) { // add another figures
                
                        let indexForm = arc4random()%UInt32(form.count)
                
                        let indexColor = arc4random()%UInt32(color.count)
                
                        let a = arc4random()%UInt32(numbers.count)
                
                        forms[numbers[Int(a)]] = form[Int(indexForm)]
                
                        colors[numbers[Int(a)]] = color[Int(indexColor)]
                
                        if form[Int(indexForm)] == slideFigure.0 && color[Int(indexColor)] == slideFigure.1 {
                    
                            forms[numbers[Int(a)]] = "square"
                    
                            colors[numbers[Int(a)]] = "#29083c" // to not add the slideFigure
                        }
                
                        numbers.remove(at: Int(a))
                    }
       
                case "ultra":
            
                    var aform = ["circle","square"]
            
                    var acolor = ["#29083c"]
            
                    subViewsTag = Array(repeating: 0, count: 16)
            
                    var available = [Int]()
            
                    for i in 0...15 {
                
                        available.append(i)
                    }
            
                    for _ in 1...8 {
                
                        let f = form[Int(arc4random()%UInt32(form.count))]
                
                        let c = color[Int(arc4random()%UInt32(color.count))]
                
                        let uf = aform[Int(arc4random()%UInt32(aform.count))]
                
                        let uc = acolor[Int(arc4random()%UInt32(acolor.count))]
                
                        let df = aform[Int(arc4random()%UInt32(aform.count))]
                
                        let dc = acolor[Int(arc4random()%UInt32(acolor.count))]
                
                        for _ in 1...2 {
                    
                            let a = Int(arc4random()%UInt32(available.count))
                    
                            let ind = available[a]
                    
                            available.remove(at: a)
                    
                            forms[ind] = f
                    
                            colors[ind] = c
                    
                            upFigures[ind] = (uf,uc)
                    
                            downFigures[ind] = (df,dc)
                        }
                    }
            
                default:
            
                    for _ in 1...numberFigures/2 {
            
                        let indexForm = arc4random()%UInt32(form.count)
            
                        let indexColor = arc4random()%UInt32(color.count)
            
                        for _ in 1...2 {
                
                            let a = arc4random()%UInt32(numbers.count)
                
                            forms[numbers[Int(a)]] = form[Int(indexForm)]
                
                            colors[numbers[Int(a)]] = color[Int(indexColor)]
                
                            numbers.remove(at: Int(a))
                        }
                    }
                } // switch lvl end

        //Расстановка
                for _ in 1...Int(onHeight) {
            
                    for _ in 1...Int(onWidth) {
                
                        let button = UILabel(frame: CGRect(x: onX , y: onY , width: width, height: height))
                
                        button.backgroundColor = hexStringToUIColor(hex: colors[k])
                
                        button.isEnabled = false
                
                        button.tag = k
                
                        button.alpha = 0.0
                
                        if forms[k] == "triangle" {
                    
                            makeForm(figure: button, form: "triangle")
                        }
               
                        if forms[k] == "rect" {
                    
                            makeForm(figure: button, form: "rect")
                        }
                
                        if forms[k] == "circle" {
                    
                            makeForm(figure: button, form: "circle")
                        }
                
                        figures.append(button)
                
                        if !isBlockedByPause {
                
                            self.view.addSubview(figures[k])
                        }
                
                        k = k + 1
                
                        onX = onX + width + dx
                    }
            
                    onX = dx
            
                    onY = onY - height - dx
                }
        
                var u = false
        
                if lvl == "ultra" {
            
                    addSubviews()
            
                    u = true
                }
        
                for i in 0..<Int(onWidth*onHeight) {
            
                    figures[i].alpha = 1.0

                    u ? (subViews[i].0.alpha = 1.0):()
            
                    u ? (subViews[i].1.alpha = 1.0):()
                }
    
                if lvl != "slide" {
            
                    timer = Timer.scheduledTimer(timeInterval: timeToLook, target: self, selector: #selector(ViewController.closeImages), userInfo: nil, repeats: false)// check when timer is turn-off
                } else {
            
                    gameTimer.invalidate()
            
                    if !isBlockedByPause {
                
                        isClosed = false
                
                        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reduceScore), userInfo: nil, repeats: true)
                    }
            
                    state = "play"
            
                    for i in closeFigures {
                
                        i.isHidden = true
                    }
            
                    slideTimer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: {_ in
                
                        for i in self.figures {
                    
                            i.isHidden = false
                    
                            i.isEnabled = true
                        }
                    })
            
                    displayBonus(clear: false)
            
                    displayNext(i: 0, form: slideFigure.0, color: slideFigure.1)
                } // states for slide end
            
            } // isBlocked by pause end
        
        } // if state gameover end
    }
 
    
    
    func gameOver () {
       
        state = "gameover"
        
        bonusTime = 0
        
        pauseOutlet.alpha = 0.0
        
        bonusPoints.text = ""
        
        nextFigure.alpha = 0.0
        
        upNext.alpha = 0.0
        
        downNext.alpha = 0.0
        
        nextFigureLab.alpha = 0.0
        
        bonusLab.alpha = 0.0
        
        clear()
        
        UIView.animate(withDuration: 3.0, animations: {
        
            self.restartOutlet.alpha = 1.0
        })
    }
   
    
    
    func addBonus (p: Bool, num : Int) {
        
        var a = num
        
        var k = true
        
        if num != 0 {
        
            switch p {
            
            case false:
            
                self.gameTime -= 1
                
                self.gameTimeLabel.text! = self.scoreToTime(s: self.gameTime)
                
                if self.gameTime == 0 {
                
                    k = false
                }
            
            case true:
            
                self.gameTime += 1
                
                self.gameTimeLabel.text! = self.scoreToTime(s: self.gameTime)
                
                if lvl == "slide" {
                    
                    if slideScore != 1 && slideScore != 0 {
                        
                        slideScore -= 1
                    
                    } else {
                    
                        slideScore = 0
                    }
                }
            }
                
            p == true ? (self.bonusTime -= 1):(self.bonusTime += 1)
            
            self.displayBonus(clear: false)
            
            p == true ? (a -= 1):(a += 1)
            
            if k {
            
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false, block:{ _ in self.addBonus(p: p,num: a)})
            
            } else { self.gameOver() }
            
        } else {
        
            let a = score % 100
            
            switch a {
            
            case 0...3:
                
                lvl = "easy"
            
                timeToLook = 1.0
            
            case 4...9:
                
                lvl = "medium"
            
                timeToLook = 3.0
            
            case 10...39:
                
                lvl = "slide"
            
                slideScore = 40 - a
            
            case 40...49:
                
                lvl = "hard"
            
                timeToLook = 6.0
            
            case 50...99:
                
                lvl = "ultra"
            
                timeToLook = 10.0
            default:
                break
            }
           
            isBlockedBySlide = false
            
            userDef.set(lvl, forKey: "lvl")
            
            if lvl != "slide" { displayBonus(clear: true) }
            
            if lvl == "slide" && bonusPoints.text == "0" { displayBonus(clear: true) }
            
            closeTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in self.generateFigures(self.lvl)})
        }
    }
    
    
    
    func reduceScore () {
        
        if !isClosed {
        
            timeScore += 1
            
            currentTimeLabel.text = scoreToTime(s: timeScore)
            
            if timeScore > userDef.value(forKey: "highScore") as! Int {
            
                userDef.set(timeScore, forKey: "highScore")
                
                highSoreTime.text = scoreToTime(s: timeScore)
            }
            
            gameTime -= 1
            
            gameTimeLabel.text! = scoreToTime(s: gameTime)
            
            if gameTime == 0 {
            
                currentTimeLabel.text! = scoreToTime(s: timeScore)
                
                gameTimer.invalidate()
                
                gameOver()
            }
        }
    }
    
    
    
    func play (_ sender: UILabel) {
        
        sender.isEnabled = false
        
        switch lvl { // compare block
        
        case "slide":
        
            if slideFigure.0 == forms[sender.tag] && slideFigure.1 == colors[sender.tag] {
            
                tapCounts += 1
                
                sender.alpha = 0.0
                
                bonusTime += 1
                
                score  += 1
                
                displayBonus(clear: false)
                
                animStart(f: sender, c: "plus")
            
            } else {
            
                bonusTime -= 1
                
                if bonusTime < 0 {bonusTime = 0}
                
                score -= 1
                
                displayBonus(clear: false)
                
                animStart(f: sender, c: "minus")
            }
            
        case "ultra":
           
            closeFigures[sender.tag].isHidden = true
            
            closeFigures[sender.tag].removeFromSuperview()
            
            subViews[sender.tag].0.alpha = 1.0
            
            subViews[sender.tag].1.alpha = 1.0
            
            sender.alpha = 1.0
            
            if tapCounts != 0 {
            
                if (tagToCompare == subViewsTag[sender.tag]) {
                
                    bonusTime += 1
                    
                    score += 1
                    
                    displayBonus(clear: false)
                
                } else {
                
                    if !isGroupEnd {
                    
                        bonusTime -= 1
                        
                        displayBonus(clear: false)
                    }
                }
                
                isGroupEnd = true
                
                for i in 0..<figures.count {
                
                    if subViewsTag[i] == subViewsTag[sender.tag] {
                    
                        closeFigures[i].isHidden == true ? ():(isGroupEnd = false)
                    }
                }
            }
            
            tagToCompare = subViewsTag[sender.tag]
        
        default:
        
            closeFigures[sender.tag].isHidden = true
            
            closeFigures[sender.tag].removeFromSuperview()
            
            sender.alpha = 1.0
            
            if tapCounts != 0 {
            
                if (figureToCompare.0 == forms[sender.tag]) && (figureToCompare.1 == colors[sender.tag]) {
                
                    score += 1
                    
                    bonusTime += 1
                    
                    animStart(f: figures[sender.tag], c: "plus")
                    
                    displayBonus(clear: false)
                
                } else {
                
                    if !isGroupEnd {
                    
                        bonusTime -= 1
                        
                        displayBonus(clear: false)
                        
                        animStart(f: figures[sender.tag], c: "minus")
                    }
                }
                
                isGroupEnd = true
                
                for i in 0..<figures.count {
                
                    if (forms[sender.tag] == forms[i]) && (colors[sender.tag] == colors[i]) {
                    
                        closeFigures[i].isHidden == true ? ():(isGroupEnd = false)
                    }
                }
            }
            
            figureToCompare = (forms[sender.tag],colors[sender.tag])
        
        } // compare block end
        
        
        if lvl != "slide" {
            
            tapCounts += 1
            
            isGroupEnd == true ? (displayNext(i: 555,form: "",color: "")):(displayNext(i: sender.tag,form: "",color: ""))
        }
        
        var a = false
        
        var b = false
        
        var j = Bool()
        
        switch lvl {
        
        case "slide":
        
            if tapCounts == countSlide || score == 40 { // score 20 is equal in addBonus!
            
                a = true
                
                isBlockedBySlide = true
            }
            
            j = a
        
        default:
        
            if tapCounts % figures.count == 0 { b = true }
            
            j = b
        }
        
        if j {
        
            isGroupEnd = true
            
            isClosed = true
            
            gameTimer.invalidate()
            
            var u = false
            
            if lvl == "ultra" { u = true }
            
            for i in figures {
            
                UIView.animate(withDuration: 0.2, animations: {
                    i.alpha = 0.0
                
                    if u {
                    
                        self.subViews[i.tag].0.alpha = 0.0
                        
                        self.subViews[i.tag].1.alpha = 0.0
                    }
                })
            }
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: {_ in self.clear()})
            
            var pref = false
            
            bonusTime < 0 ? (pref = false):(pref = true)
            
            displayNext(i: 777, form: "", color: "")
            
            addBonus (p: pref, num: bonusTime)
        }
    }
    
    
    
    func closeImages() {
        
        state = "closing"
        
        for i in figures {
        
            i.alpha = 0.0
            
            if lvl == "ultra" {
            
                subViews[i.tag].0.alpha = 0.0
                
                subViews[i.tag].1.alpha = 0.0
            }
            
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
            
            if !isBlockedByPause {
            
                self.view.addSubview(closeFigures[i.tag])
            }
            
            i.isEnabled = true
        }
        
        isClosed = false
        
        gameTimer.invalidate()
        
        if !isBlockedByPause {
        
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reduceScore), userInfo: nil, repeats: true)
        }
        
        state = "play"
        
        displayNext(i: 555,form: "",color: "")
        
        if lvl != "slide" { displayBonus(clear: false) }
    }
    
    
    
    @IBAction func pause(_ sender: UIButton) {
    
        gameTimer.invalidate()
    
        isBlockedByPause = true
    
        userDef.set(state, forKey: "state")
    
        bonusTime = 0
    
        bonusPoints.text = "0"
    
        switch state {
    
        case "generate":
    
            clear()
        
        case "closing":
    
            clear()
        
        default:
                break
        }
    
        pauseOutlet.alpha = 0.0
    
        addPopMenu()
    
    }
    
    @IBAction func closePopMenu(_ sender: UIButton) {
       
        popPlayOut.removeFromSuperview()
        popRestartOut.removeFromSuperview()
        popHowOut.removeFromSuperview()
        popHowLab.removeFromSuperview()
        popRestartLab.removeFromSuperview()
        popPlayLab.removeFromSuperview()
        popMenu.removeFromSuperview()
        pauseOutlet.alpha = 1.0
        isBlockedByPause = false
        clear()
        
        if sender.tag == 55 { lvl = "easy" }
        
        generateFigures(lvl)
    }
    
    @IBAction func restartButton(_ sender: AnyObject) {
        
       state = "newgame"
       
        if figures.count != 0 {
        
            clear()
        }
        
        restartOutlet.alpha = 0
        
        score = 0
        
        timeScore = 0
        
        lvl = "easy"
        
        gameTime = 5
        
        bonusTime = 0
        
        bonusLab.alpha = 1.0
        
        pauseOutlet.alpha = 1.0
        
        nextFigureLab.alpha = 1.0
        
        currentTimeLabel.text = scoreToTime(s: score)
        
        gameTimeLabel.text! = scoreToTime(s: gameTime)
        
        generateFigures(lvl)
        
        UIView.animate(withDuration: 0.5, animations: {
        
            self.restartOutlet.alpha = 0.0
        })
    }

    
    func clear () {
        
        for i in subViews {
            i.0.removeFromSuperview()
            i.1.removeFromSuperview()
        }
       
        for i in figures{
            i.removeFromSuperview()
        }
        
        for i in closeFigures {
            i.removeFromSuperview()
        }
        
        tapCounts = 0
        forms.removeAll()
        colors.removeAll()
        figures.removeAll()
        subViews.removeAll()
        subViewsTag.removeAll()
        closeFigures.removeAll()
        isGroupEnd = false
    }
    
    
    
    func showRules (_: UIButton?) {
        
        performSegue(withIdentifier: "showRulesSeg", sender: self)
    }
    
    
    
    func displayNext (i: Int, form: String, color: String) {
       
        nextFigure.alpha = 1.0
        
        switch i {
        
        case 555: // 555 = no up no down figures
        
            nextFigure.backgroundColor = hexStringToUIColor(hex: "#d5d5ea")
            
            upNext.backgroundColor = UIColor.clear
            
            downNext.backgroundColor = UIColor.clear
            
            let mask = CAShapeLayer()
            
            mask.frame = nextFigure.layer.bounds
            
            let width = nextFigure.layer.frame.width
            
            let height = nextFigure.layer.frame.height
            
            let path = CGMutablePath()
            
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            
            mask.path = path
            
            nextFigure.layer.mask = mask
        
        case 777:
        
            nextFigure.backgroundColor = UIColor.clear
            
            upNext.backgroundColor = UIColor.clear
            
            downNext.backgroundColor = UIColor.clear
            
        default:
            
        var f = forms[i]
       
        var c = hexStringToUIColor(hex: colors[i])
        
        if lvl == "slide" {f = slideFigure.0; c = hexStringToUIColor(hex: slideFigure.1)}
        
        if lvl == "ultra" {
        
            let uf = upFigures[i].0
            
            let uc = upFigures[i].1
            
            let df = downFigures[i].0
            
            let dc = downFigures[i].1
            
            upNext.alpha = 1.0
            
            downNext.alpha = 1.0
            
            upNext.backgroundColor = hexStringToUIColor(hex: uc)
            
            downNext.backgroundColor = hexStringToUIColor(hex: dc)
            
            makeForm(figure: upNext, form: uf)
            
            makeForm(figure: downNext, form: df)
        }
        
        nextFigure.backgroundColor = c
        
        makeForm(figure: nextFigure, form: f)
        
        }
    }
    
    
    
    func animStart(f: UILabel, c: String) {
        
        let j = UILabel()
        
        j.frame = CGRect(x: f.frame.origin.x + f.frame.width/2 - 15, y: f.frame.origin.y + f.frame.height/2 - 10, width: 45, height: 45)
        
        j.center = f.center
        
        j.font = UIFont(name: "Perfograma", size: 40.0)
        
        j.textAlignment = .center
        
        c == "plus" ? (j.text = "+1"):(j.text = "-1")
        
        c == "plus" ? (j.textColor = UIColor.green):(j.textColor = UIColor.red)
        
        animMas.append(j)
        
        self.view.addSubview(animMas.last!)
        
        UIView.animate(withDuration: 0.7, animations: {
        
            j.frame.origin.y -= 5
            
            j.alpha = 0.0
        
        }, completion: {(_) in
            
            for i in self.animMas {
        
                i.removeFromSuperview()
            }
            
            self.animMas.removeAll()
        })
    }
    
    
    
    func displayBonus (clear: Bool) {
        
        clear ? (bonusPoints.textColor = UIColor.clear):(bonusPoints.textColor = UIColor.black)
        
        bonusPoints.textAlignment = .center
        
        let s = String()
        
        if lvl == "slide" {
        
            bonusPoints.frame = CGRect(x: super.view.frame.width / 2 - 5 , y: gameTimeLabel.frame.origin.y + 65, width: 140, height: 50)
        
            bonusTime < 0 ? (bonusPoints.text = "-"+s+"\(-1*bonusTime)/\(slideScore)") : (bonusPoints.text = s+"\(bonusTime)/\(slideScore)")
        
        } else {
        
            bonusPoints.frame = CGRect(x: super.view.frame.width / 2 + 5, y: gameTimeLabel.frame.origin.y + 65, width: 80, height: 50)
            
            bonusTime < 0 ? (bonusPoints.text = "-"+s+"\(-1*bonusTime)") : (bonusPoints.text = s+"\(bonusTime)")
        }
        
        if state == "gameover" {
        
            bonusPoints.text = ""
        }
    }
    
    
    
    func addPopMenu() {
        
        popPlayOut.frame = CGRect(x: super.view.frame.width/2 - 15, y: -50, width: 30, height: 30)
        let i1 = UIImage(named: "play")
        popPlayOut.setBackgroundImage(i1, for: .normal)
        popPlayOut.isEnabled = false
        popPlayLab.frame = CGRect(x: popPlayOut.frame.origin.x - 6, y: popPlayOut.frame.origin.y + 30, width: 44, height: 15)
        popPlayLab.font = UIFont.systemFont(ofSize: 10.0, weight: UIFontWeightThin)
        popPlayLab.text = "Continue"
        popPlayOut.addTarget(Any.self, action: #selector(self.closePopMenu(_:)), for: UIControlEvents.touchUpInside)
    
        
        popRestartOut.frame = CGRect(x: super.view.frame.width/4 - 15, y: -50, width: 30, height: 30)
        let i2 = UIImage(named: "restart")
        popRestartOut.setBackgroundImage(i2, for: .normal)
        popRestartOut.isEnabled = false
        popRestartOut.tag = 55
        popRestartOut.addTarget(Any.self, action: #selector(self.closePopMenu(_:)), for: .touchUpInside)
        popRestartLab.frame = CGRect(x: popRestartOut.frame.origin.x - 10, y: popRestartOut.frame.origin.y + 30, width: 60, height: 15)
        popRestartLab.font = UIFont.systemFont(ofSize: 10.0, weight: UIFontWeightThin)
        popRestartLab.text = "New Game"
        
        
        popHowOut.frame = CGRect(x: super.view.frame.width * 3/4 - 15, y: -50, width: 30, height: 30)
        let i3 = UIImage(named: "howto")
        popHowOut.setBackgroundImage(i3, for: .normal)
        popHowOut.isEnabled = false
        popHowLab.frame = CGRect(x: popHowOut.frame.origin.x - 13, y: popHowOut.frame.origin.y + 30, width: 58, height: 15)
        popHowLab.font = UIFont.systemFont(ofSize: 10.0, weight: UIFontWeightThin)
        popHowLab.text = "How To Play"
        popHowOut.addTarget(self, action: #selector(showRules(_:)), for: .touchUpInside)
        
        popMenu.frame = super.view.frame
        popMenu.backgroundColor = UIColor.white
        popMenu.addSubview(popPlayOut)
        popMenu.addSubview(popPlayLab)
        popMenu.addSubview(popRestartOut)
        popMenu.addSubview(popRestartLab)
        popMenu.addSubview(popHowOut)
        popMenu.addSubview(popHowLab)
        
        super.view.addSubview(popMenu)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.popPlayOut.center.y += super.view.frame.height / 2
            self.popPlayLab.center.y += super.view.frame.height / 2
            self.popRestartOut.center.y += super.view.frame.height / 2
            self.popRestartLab.center.y += super.view.frame.height / 2
            self.popHowLab.center.y += super.view.frame.height / 2
            self.popHowOut.center.y += super.view.frame.height / 2
        }, completion: { (_) in // unlock touch after set
            self.popPlayOut.isEnabled = true
            self.popRestartOut.isEnabled = true
            self.popHowOut.isEnabled = true
        })
        
    }
    
    
    
    func addSubviews() {
        var lock = Array(repeating: false, count: 16)
        var a = 0
        for i in 0...15 {
            if !lock[i] {
                subViewsTag[i] = a
                lock[i] = true
                var ind = 0
                for j in 0...15 {
                    var k = false
                    if upFigures[i] == upFigures[ind] && downFigures[i] == downFigures[ind] {k = true}
                    if forms[i] == forms[j] && colors[i] == colors[j] && k {
                        lock[ind] = true
                        subViewsTag[ind]=a
                    }
                    ind += 1
                }
                a += 1
            }
        }
        for i in figures {
            let a = i.frame.width/2
            let b = i.frame.height/2
            let button = UILabel(frame: CGRect(x: i.frame.origin.x - a/3 , y: i.frame.origin.y - b/3 , width: i.frame.width/2, height: i.frame.height/2))
            let button2 = UILabel(frame: CGRect(x: i.frame.origin.x + 4*a/3 , y: i.frame.origin.y + 4*b/3 , width: i.frame.width/2, height: i.frame.height/2))
            button.backgroundColor = hexStringToUIColor(hex: upFigures[i.tag].1)
            button.isEnabled = false
            button.alpha = 0.0
            makeForm(figure: button, form: upFigures[i.tag].0)
            button2.backgroundColor = hexStringToUIColor(hex: downFigures[i.tag].1)
            button2.isEnabled = false
            button2.alpha = 0.0
            makeForm(figure: button2, form: downFigures[i.tag].0)
            subViews.append((button,button2))
            super.view.addSubview(subViews[i.tag].0)
            super.view.addSubview(subViews[i.tag].1)
        }
    }
    
    
    
    func scoreToTime (s: Int) -> String {
        var seconds = "\(s%60)"
        var minutes = "\(s/60)"
        if s/60 < 10 {
            minutes = "0"+minutes
        }
        if s%60 < 10 {
            seconds = "0"+seconds
        }
        return("\(minutes):\(seconds)")
    }
    
    
    
    func makeForm (figure: UILabel, form : String) {
       
        let mask = CAShapeLayer()
        mask.frame = figure.layer.bounds
        let width = figure.layer.frame.width
        let height = figure.layer.frame.height
        let path = CGMutablePath()
        
        if form == "square" {
            path.move(to: CGPoint(x: 0.0, y: 0.0))
            path.addLine(to: CGPoint(x: width, y: 0.0))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0.0, y: height))
            mask.path = path
            figure.layer.mask = mask
        }
       
        if form == "triangle" {
            path.move(to: CGPoint(x: 0.0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width/2, y: 0.0))
            path.addLine(to: CGPoint(x: 0.0, y: height))
            mask.path = path
            figure.layer.mask = mask
        }
       
        if form == "rect" {
            path.move(to: CGPoint(x: 0.2*width, y: height))
            path.addLine(to: CGPoint(x: width, y: 0.2*height))
            path.addLine(to: CGPoint(x: 0.8*width, y: 0.0))
            path.addLine(to: CGPoint(x: 0.0, y: 0.8*height))
            mask.path = path
            figure.layer.mask = mask
        }
        
        if form == "circle" {
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            mask.path = path
            figure.layer.mask = mask
        }
    }
    
    
   
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    func makeTouch (_ touch: AnyObject) {
       
        let position = touch.location(in: super.view)
        
        for i in figures {
        
            if i.frame.contains(position) && i.isEnabled == true {
            
                if !isBlockedBySlide { play(i) }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
    
            makeTouch(touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for touch : AnyObject in touches {
        
            makeTouch(touch)
        }
    }
   
}

