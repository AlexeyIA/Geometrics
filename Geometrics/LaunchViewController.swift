





import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var launchImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.0, animations: {
            
            self.launchImageView.alpha = 0
            
            }, completion: {(_) in
                
                self.showSegue()
            })
    }
    
    
    
    func showSegue () {
        
        self.performSegue(withIdentifier: "fromLaunchToMain", sender: self)
        
        print("segue ok")
    }

    
    
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()

    }


}
