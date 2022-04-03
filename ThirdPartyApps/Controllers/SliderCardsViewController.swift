import UIKit
import CardSlider

class SliderCardsViewController: UIViewController, CardSliderDataSource {

    @IBOutlet weak var sliderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let controller = CardSliderViewController.with(dataSource: self)
        controller.title = "Images"
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let cardSlider = CardSliderViewController.with(dataSource: self)
//        cardSlider.title = "Movies"
//        cardSlider.modalPresentationStyle = .fullScreen
//        present(cardSlider, animated: true, completion: nil)
//    }
  
    func item(for index: Int) -> CardSliderItem {
        return items[index]
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
}

struct Item: CardSliderItem {
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

fileprivate let items: [Item] = [
    Item(image: UIImage(named: "image1")!,
         rating: 3,
         title: "Fuji",
         subtitle: "Mount Fuji",
         description: "Mount Fuji, Japan, is one of the most famous mountains in the world. Mount Fuji is a composite cone, or stratovolcano. Composite cones, formed by violent eruptions, have layers of rock, ash, and lava."),
    Item(image: UIImage(named: "image2")!,
         rating: 4,
         title: "Goden Gate",
         subtitle: "Goden Gate Bridge",
         description: "The Golden Gate is a strait on the west coast of North America that connects San Francisco Bay to the Pacific Ocean. It is defined by the headlands of the San Francisco Peninsula and the Marin Peninsula, and, since 1937, has been spanned by the Golden Gate Bridge. The entire shoreline and adjacent waters throughout the strait are managed by the Golden Gate National Recreation Area.")
]
