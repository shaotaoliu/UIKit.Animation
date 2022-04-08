import UIKit
import Lottie

class LottieViewController: UIViewController {

    @IBOutlet weak var myView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rocketTapped(_ sender: Any) {
        startAnimation(name: "rocket", width: myView.frame.width, height: myView.frame.height)
    }
    
    @IBAction func jumpTapped(_ sender: Any) {
        startAnimation(name: "jump", width: myView.frame.width, height: myView.frame.height)
    }
    
    @IBAction func switchTapped(_ sender: Any) {
        startAnimation(name: "switch", width: 150, height: 100)
    }
    
    @IBAction func boatTapped(_ sender: Any) {
        startAnimation(name: "boat", width: 300, height: 300)
    }
    
    private func startAnimation(name: String, width: CGFloat, height: CGFloat) {
        for subview in myView.subviews {
            subview.removeFromSuperview()
        }
        
        let x = (myView.frame.width - width) / 2.0
        let y = (myView.frame.height - height) / 2.0
        
        // let animationView = AnimationView(name: name)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named(name)
        
        animationView.frame = CGRect(x: x, y: y, width: width, height: height)
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        myView.addSubview(animationView)
        animationView.play()
        
//        animationView.play() { finished in
//            print("Done")
//        }
    }
}
