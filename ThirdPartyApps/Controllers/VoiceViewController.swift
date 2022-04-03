import UIKit
import InstantSearchVoiceOverlay

class VoiceViewController: UIViewController {

    private let voiceOverlay = VoiceOverlayController()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        voiceOverlay.start(on: self, textHandler: { text, final, _ in
            self.textView.text = text
            
        }, errorHandler: { error in
            
        })
    }
    
}

/* Info.plist
 
 Privacy - Microphone Usage Description
 Privacy - Speech Recognition Usage Description
 
 */
