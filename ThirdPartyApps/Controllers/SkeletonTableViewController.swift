import UIKit
import SkeletonView

class SkeletonTableViewController: UITableViewController, SkeletonTableViewDataSource {

    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            (1...6).forEach { i in
                self.items.append("Item \(i)")
            }
            
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            
            // self.view.hideSkeleton()
            // self.tableView.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // tableView.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
        // tableView.showAnimatedSkeleton(usingColor: .gray, animation: nil, transition: .crossDissolve(0.25))
        
        tableView.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(baseColor: .gray), animation: nil, transition: .crossDissolve(0.25))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SkeletonTableViewCell
        cell.myImageView?.image = UIImage(systemName: "photo")
        cell.myIabel.text = items[indexPath.row]
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
}
