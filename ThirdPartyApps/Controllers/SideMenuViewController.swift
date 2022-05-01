import UIKit
import SideMenu

class SideMenuViewController: UIViewController, MenuListViewControllerDelegate {

    @IBOutlet weak var label: UILabel!
    var controller: SideMenuNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menuController = MenuListViewController()
        menuController.delegate = self
        
        controller = SideMenuNavigationController(rootViewController: menuController)
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
    
    func menuItemTapped(item: String) {
        controller.dismiss(animated: true, completion: nil)
        label.text = item
    }
}

class MenuListViewController: UITableViewController {
    
    let items = ["First", "Second", "Third", "Fourth", "Fifth"]
    weak var delegate: MenuListViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .darkGray
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .darkGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.menuItemTapped(item: items[indexPath.row])
    }
}

protocol MenuListViewControllerDelegate: AnyObject {
    
    func menuItemTapped(item: String)
    
}
