//
//  ViewController.swift
//  MasterGo
//
//  Created by aBoelghet  on 27/12/2021.
//

import UIKit
import PageControls

class IntroContentViewController: UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet weak var pageControl:PillPageControl!
    @IBOutlet var forwardButton: UIButton!

    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        pageControl.progress = CGFloat(index)
        switch index {
        case 0...2:
            forwardButton.setTitle("NEXT", for: .normal)
            forwardButton.widthAnchor.constraint(equalToConstant: 315.0).isActive = true
            forwardButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        case 3:
            forwardButton.setTitle("+", for: .normal)
            forwardButton.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
            forwardButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
            forwardButton.layer.masksToBounds = true
            forwardButton.layer.cornerRadius = (forwardButton.frame.height)/2


        default: break
        }

    }
    @IBAction func nextButtonTapped(sender: UIButton) {

        switch index {
        case 0...2: // Next Button
            let pageViewController = parent as! IntroPageViewController
            pageViewController.forward(index: index)

        case 3: // Done Button
            UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")

            // Add Quick Actions
            if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                let bundleIdentifier = Bundle.main.bundleIdentifier
                let shortcutItem1 = UIApplicationShortcutItem(type: "\(String(describing: bundleIdentifier)).OpenFavorites", localizedTitle: "Show Favorites", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "favorite-shortcut"), userInfo: nil)
                let shortcutItem2 = UIApplicationShortcutItem(type: "\(String(describing: bundleIdentifier)).OpenDiscover", localizedTitle: "Discover Restaurants", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "discover-shortcut"), userInfo: nil)
                let shortcutItem3 = UIApplicationShortcutItem(type: "\(String(describing: bundleIdentifier)).NewRestaurant", localizedTitle: "New Restaurant", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .add), userInfo: nil)
                UIApplication.shared.shortcutItems = [shortcutItem1, shortcutItem2, shortcutItem3]
            }

            dismiss(animated: true, completion: nil)

        default: break

        }
    }
  

}

