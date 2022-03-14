
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    }
   
    
    @IBAction func showTest(_ sender: Any) {
    }
    
    /*
    @objc func closeImages() {
        
        for i in figures {

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
         
            i.isEnabled = true
        }
 
    */
    
    
    /*
    
    func displayNext (i: Int, form: String, color: String) {
   
            nextFigure.backgroundColor = hexStringToUIColor(hex: "#d5d5ea")
            
            let mask = CAShapeLayer()
            
            mask.frame = nextFigure.layer.bounds
            
            let width = nextFigure.layer.frame.width
            
            let height = nextFigure.layer.frame.height
            
            let path = CGMutablePath()
            
            path.addEllipse(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
            
            mask.path = path
            
            nextFigure.layer.mask = mask
        
    }
    */
 
    /*
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
 */
 
    
    
/*
    func touchAct (_ touch: AnyObject) {
       
        let position = touch.location(in: super.view)
        
        for i in figures {
        
            if i.frame.contains(position) && i.isEnabled == true {
            
                 play(i)
            }
        }
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
    
            touchAct(touch)
        }
    }
    
    func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        for touch : AnyObject in touches {
        
            touchAct(touch)
        }
    }
 */
   
}

