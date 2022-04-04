import UIKit

class FloatPanelTableViewController: UITableViewController {

    let cities = [
        "Irvine",
        "Lake Forest",
        "Mission Viejo",
        "Orange",
        "Tustin",
        "Laguna Hills",
        "Laguna Beach",
        "Dana Point",
        "Newport Beach",
        "Long Beach"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }

}
