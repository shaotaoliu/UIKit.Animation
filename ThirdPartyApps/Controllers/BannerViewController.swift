import UIKit
import NotificationBannerSwift

class BannerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        showBanner(style: .info)
    }
    
    @IBAction func successButtonTapped(_ sender: Any) {
        showBanner(style: .success)
    }
    
    @IBAction func dangerButtonTapped(_ sender: Any) {
        showBanner(style: .danger)
    }
    
    @IBAction func warningButtonTapped(_ sender: Any) {
        showBanner(style: .warning)
    }
    
    private func showBanner(style: BannerStyle) {
        let banner = NotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John, long time no see. How is it going? Where have you been in these days?",
            style: style)
        
        banner.show()
    }
    
    @IBAction func statusBarButtonTapped(_ sender: Any) {
        let banner = StatusBarNotificationBanner(title: "Hello World", style: .info)
        banner.show()
    }
    
    @IBAction func growingButtonTapped(_ sender: Any) {
        let banner = GrowingNotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John, long time no see. How is it going? Where have you been in these days?",
            style: .success)
        
        banner.show()
    }

    @IBAction func bottomButtonTapped(_ sender: Any) {
        let banner = NotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John. How is it going?",
            style: .danger)
        
        banner.autoDismiss = false
        banner.dismissOnTap = true
        banner.show(bannerPosition: .bottom)
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        let banner = NotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John. How is it going?",
            style: .warning)
        
        banner.autoDismiss = false
        banner.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            banner.dismiss()
        })
    }
    
    @IBAction func viewButtonTapped(_ sender: Any) {
        let leftView = UIImageView(image: UIImage(systemName: "paperplane")!)
        let banner = NotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John. How is it going?",
            leftView: leftView,
            style: .success)
        
        banner.show()
    }
    
    @IBAction func abottomButtonTapped(_ sender: Any) {
        let banner = NotificationBanner(
            title: "You have a new message",
            subtitle: "Hey John. How is it going?",
            style: .success)
        
        banner.show(queuePosition: .front)
    }
    
}
