import UIKit
import BLTNBoard

class BulletBoardViewController: UIViewController {

    lazy var manager: BLTNItemManager = {

        let item = BLTNPageItem(title: "Hello World")
        item.image = UIImage(systemName: "swift")
        item.actionButtonTitle = "Continue"
        item.alternativeButtonTitle = "Maybe Later"
        item.descriptionText = "Would you like to stay in the loop and get notifications?"
        
        item.actionHandler = { _ in
            print("Hi")
        }
        
        item.alternativeHandler = { _ in
            print("Hello")
        }
        
        let manager = BLTNItemManager(rootItem: item)
        return manager
    }()
    
    @IBAction func buttonTapped(_ sender: Any) {
        manager.showBulletin(above: self)
    }
    
}
