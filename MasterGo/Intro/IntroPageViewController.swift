//
//  IntroPageViewController.swift
//  MasterGo
//
//  Created by aBoelghet  on 27/12/2021.
//

import UIKit

class IntroPageViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    var pageHeadings = ["Proven specialists", "Honest ratings", "Insured orders","Create order"]
    var pageImages = ["Illustration", "Illustration2", "Illustration3","Illustration4"]
    var pageContent = ["We check each specialist before he starts work",
                       "We carefully check each specialist and put honest ratings",
                       "We insure each order for the amount of $500","It's easy, just click on the plus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source to itself
        dataSource = self
        
        // Create the first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! IntroContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! IntroContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // MARK: - Helper Methods
    
    func contentViewController(at index: Int) -> IntroContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "IntroContentViewController") as? IntroContentViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.content = pageContent[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func forward(index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
}



