import UIKit
import ShimmerSwift

class ShimmerViewController: UIViewController {

    @IBOutlet weak var shimmerView1: ShimmeringView!
    @IBOutlet weak var shimmerView2: ShimmeringView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shimmerView2.shimmerSpeed = 100
        shimmerView2.shimmerDirection = .left
        
        shimmerView1.contentView = label
        shimmerView2.contentView = button
        
        shimmerView1.isShimmering = true
        shimmerView2.isShimmering = true
    }

}
