







import UIKit

class showRules: UIViewController {

    var rulesTimer : Timer?
    var animTimer : Timer?
    var seconds : Int?
    
    var finga : UIImageView?
    
    var bonusLab = UILabel()
    var nextFigure = UILabel()
    var nextFigureLab = UILabel()
    var bonusPoints = UILabel()
    
    var look : Double?
    var figurs = [UILabel]()
    var closeFigurs = [UILabel]()
    var formes = [String]()
    var colores = [String]()
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var timeRule: UILabel!
    @IBOutlet weak var remember: UILabel!
    @IBOutlet weak var open: UILabel!
    @IBOutlet weak var ok: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        time.alpha = 0.0
        timeRule.alpha = 0.0
        remember.alpha = 0.0
        open.alpha = 0.0
        ok.alpha = 0.0
        rulesTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(showRules.beginRules), userInfo: nil, repeats: false)
    }

    func beginRules () {
        self.bonusLab.frame = CGRect(x: super.view.frame.width / 2 + 20, y: self.time.frame.origin.y + 60, width: 80, height: 15)
        self.bonusLab.font = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightThin)
        self.bonusLab.text = "Points:"
        self.bonusPoints.frame = CGRect(x: super.view.frame.width / 2 + 5, y: self.time.frame.origin.y + 60, width: 80, height: 50)
        self.bonusPoints.font = UIFont(name: "Luxi Mono", size: 39.0)
        self.bonusPoints.font.withSize(UIFontWeightBold)
        self.bonusPoints.text = ""
        self.nextFigureLab.frame = CGRect(x: super.view.frame.width / 2 - 60, y: self.time.frame.origin.y + 60, width: 50, height: 15)
        self.nextFigureLab.font = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightThin)
        self.nextFigureLab.text = "Next:"
        self.nextFigure.frame = CGRect(x: super.view.frame.width / 2 - 65, y: self.time.frame.origin.y + 80, width: 45, height: 45)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.time.alpha = 1.0
            self.remember.alpha = 1.0
        })
        
        rulesTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRules.generateFigures), userInfo: nil, repeats: false)

        
    }
    
    func generateFigures () {
        
        
        formes = ["circle", "circle", "square", "square"]
        colores = ["#36a9e0","#36a9e0","#e6007e","#e6007e"]
        let onWidth : CGFloat = 2
        let onHeight : CGFloat = 2
        look = 3.0
        
        var onX : CGFloat = 20.0 // start figure position
        let dx: CGFloat = 20.0 // distance between figures = dy
        
        
        let width : CGFloat = (super.view.frame.width - 2*dx - (onWidth - 1) * dx )/onWidth
        let height : CGFloat = width
        var onY : CGFloat = super.view.frame.height - dx - 1.2*height
        var k = 0
            
        
        //Расстановка
        for _ in 1...Int(onHeight) {
            for _ in 1...Int(onWidth) {
                let button = UILabel(frame: CGRect(x: onX , y: onY , width: width, height: height))
                button.backgroundColor = hexStringToUIColor(hex: colores[k])
                button.isEnabled = false
                button.tag = k
                button.alpha = 0.0
                let mask = CAShapeLayer()
                mask.frame = button.layer.bounds
                let width = button.layer.frame.width
                let height = button.layer.frame.height
                let path = CGMutablePath()
                        
                if formes[k] == "circle" {
                    path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
                    mask.path = path
                    button.layer.mask = mask
                }
                figurs.append(button)
                        
                self.view.addSubview(figurs[k])
                UIView.animate(withDuration: 0.5, animations: {
                    self.figurs[k].alpha = 1.0
                })
                k = k + 1
                onX = onX + width + dx
            }
            onX = dx
            onY = onY - height - dx
        }
        rulesTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: {_ in
           UIView.animate(withDuration: 1.0, animations: {
            self.remember.alpha = 0.0
           })
        })
        seconds = 10
        rulesTimer = Timer.scheduledTimer(timeInterval: look!, target: self, selector: #selector(showRules.closeImages), userInfo: nil, repeats: false)
        
    }
    
    func closeImages() {
        
        for i in figurs {
            i.alpha = 0.0
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
            closeFigurs.append(closeFigure)
            self.view.addSubview(closeFigurs[i.tag])
            i.isEnabled = true
        }
        nextFigureLab.alpha = 0.0
        nextFigure.alpha = 0.0
        self.view.addSubview(nextFigureLab)
        self.view.addSubview(nextFigure)
        
        finga = UIImageView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        finga?.image = UIImage(named: "finger")
        
        
        UIView.animate(withDuration: 1.0, animations: {
            self.open.alpha = 1.0
            self.nextFigureLab.alpha = 1.0
        }, completion: { _ in
            self.displayNext(i: 555)
        })
        
        rulesTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(showRules.openfig), userInfo: nil, repeats: false)
        
    }

    func openfig () {
        UIView.animate(withDuration: 1.0, animations: {
            self.open.alpha = 0.0} , completion: { (_) in
            self.rulesTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showRules.reduceScore), userInfo: nil, repeats: true)
        })
        animTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
            self.closeFigurs[0].isHidden = true
            self.closeFigurs[0].removeFromSuperview()
            self.figurs[0].alpha = 1.0
            self.displayNext(i: 0)
        })
        
        finga?.center = figurs[2].center
        finga?.center.x -= 30
        
        
        animTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { _ in
            
            self.closeFigurs[1].isHidden = true
            self.closeFigurs[1].removeFromSuperview()
            self.figurs[1].alpha = 1.0
            self.displayNext(i: 555)
        })
        
        
        animTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in
            self.closeFigurs[2].isHidden = true
            self.closeFigurs[2].removeFromSuperview()
            self.figurs[2].alpha = 1.0
            self.displayNext(i: 2)
            self.view.addSubview(self.finga!)
            UIView.animate(withDuration: 1.3, animations: {
                self.finga?.center.x = self.figurs[3].center.x}, completion: { _ in
                    self.finga!.alpha = 0.0
                    self.finga!.removeFromSuperview()
            })
        })
        animTimer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false, block: { _ in
            self.closeFigurs[3].isHidden = true
            self.closeFigurs[3].removeFromSuperview()
            self.figurs[3].alpha = 1.0
            self.displayNext(i: 777)
            
        })
        
        animTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { _ in
            
            UIView.animate(withDuration: 1.5, animations: {
                self.nextFigureLab.alpha = 0.0
                self.figurs[0].alpha = 0.0
                self.figurs[1].alpha = 0.0
                self.figurs[2].alpha = 0.0
                self.figurs[3].alpha = 0.0
                self.timeRule.alpha = 1.0
                self.ok.alpha = 1.0
                
            })
        })
    }
    
    func reduceScore () {
        seconds! -= 1
        time.text = "00:0\(seconds!)"
        if seconds! < 8 {
            rulesTimer?.invalidate()
        }
    }
    
    func displayNext (i: Int) {
        nextFigure.alpha = 1.0
        switch i {
        case 555:
            nextFigure.backgroundColor = hexStringToUIColor(hex: "#d5d5ea")
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
            
        default:
            
            let s = formes[i]
            nextFigure.backgroundColor = hexStringToUIColor(hex: colores[i])
            let mask = CAShapeLayer()
            mask.frame = nextFigure.layer.bounds
            let width = nextFigure.layer.frame.width
            let height = nextFigure.layer.frame.height
            let path = CGMutablePath()
            if s == "square" {
                path.move(to: CGPoint(x: 0.0, y: 0.0))
                path.addLine(to: CGPoint(x: width, y: 0.0))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0.0, y: height))
                mask.path = path
                nextFigure.layer.mask = mask
            }
           
            if s == "circle" {
                path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
                mask.path = path
                nextFigure.layer.mask = mask
            }
            
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let VC = segue.destination as! ViewController
        VC.userDef.set(1, forKey: "highScore")
        
        
    }
    

}
