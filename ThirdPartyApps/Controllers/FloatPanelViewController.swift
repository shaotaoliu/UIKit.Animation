import UIKit
import FloatingPanel

class FloatPanelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let controller = storyboard?.instantiateViewController(withIdentifier: "FloatPanelTableViewController") as! FloatPanelTableViewController
        
        let fpController = FloatingPanelController()
        fpController.set(contentViewController: controller)
        fpController.addPanel(toParent: self)
    }
    

}
