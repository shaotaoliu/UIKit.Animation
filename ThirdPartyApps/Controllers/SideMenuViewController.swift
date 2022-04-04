import UIKit
import SideMenu

class SideMenuViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var controller: SideMenuNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        controller = SideMenuNavigationController(rootViewController: MenuListViewController())
        controller.leftSide = true
        
        // controller.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = controller
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(didMenuTapped))
    }
    
    @IBAction func didMenuTapped() {
        present(controller, animated: true)
    }
    
    @IBAction func didDismissTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

class MenuListViewController: UITableViewController {
    
    let items = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
