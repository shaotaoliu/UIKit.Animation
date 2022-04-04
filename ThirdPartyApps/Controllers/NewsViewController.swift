import UIKit
import WhatsNewKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        let news = WhatsNew(title: "New Features", features: [
            WhatsNew.Feature(image: WhatsNew.Feature.Image(systemName: "star.fill", foregroundColor: .orange),
                             title: "Face ID",
                             subtitle: "Face ID while wearing a mask option on iPhone 12 and newer"),
            
            WhatsNew.Feature(image: WhatsNew.Feature.Image(systemName: "wand.and.stars", foregroundColor: .blue),
                             title: "Emoji",
                             subtitle: "New emoji including faces, hand gestures, and household objects are now available in emoji keyboard"),
            
            WhatsNew.Feature(image: WhatsNew.Feature.Image(systemName: "staroflife.fill", foregroundColor: .green),
                             title: "Siri",
                             subtitle: "Siri can provide time and date information while offline on iPhone XS, iPhone XR, iPhone 11 or newer"),
            
            WhatsNew.Feature(image: WhatsNew.Feature.Image(systemName: "swift", foregroundColor: .pink),
                             title: "Vaccine Cards",
                             subtitle: "EU Digital COVID Certificate support in Health enables you to download and store verifiable versions of COVID-19 vaccination")
        ])
        
        let vc = WhatsNewViewController(whatsNew: news)
        present(vc, animated: true)
        
//        if let vc = WhatsNewViewController(whatsNew: news, versionStore: UserDefaultsWhatsNewVersionStore()) {
//            present(vc, animated: true)
//        }
    }
}
