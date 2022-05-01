import UIKit
import YouTubeiOSPlayerHelper

class YouTubeViewController: UIViewController {

    @IBOutlet weak var videoView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://www.youtube.com/watch?v=bsM1qdGAVbU
        videoView.load(withVideoId: "bsM1qdGAVbU")
        
        // play in the frame:
        // videoView.load(withVideoId: "bsM1qdGAVbU", playerVars: [
        //     "playsinline": 1
        // ])
    }
    
    @IBAction func playVideo(_ sender: Any) {
        videoView.playVideo()
    }
    
}
