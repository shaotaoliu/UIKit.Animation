import UIKit
import Swinject

class SwinjectViewController: UIViewController {
    
    let container = Container()

    override func viewDidLoad() {
        super.viewDidLoad()

        container.register(IServiceProvider.self) { _ in
            return ServiceProvider()
        }
        
        container.register(MyViewController.self) { container in
            return MyViewController(provider: container.resolve(IServiceProvider.self)!)
        }
    }

    @IBAction func buttonTapped() {
        guard let controller = container.resolve(MyViewController.self) else {
            return
        }
        
        present(controller, animated: true)
    }
}

fileprivate protocol IServiceProvider {
    var color: UIColor { get }
    func process()
}

fileprivate class ServiceProvider: IServiceProvider {
    var color: UIColor {
        return .systemGreen
    }
    
    func process() {
        print("Processed")
    }
}

fileprivate class MyViewController: UIViewController {
    private let provider: IServiceProvider!
    
    init(provider: IServiceProvider) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = provider.color
        provider.process()
    }
}
