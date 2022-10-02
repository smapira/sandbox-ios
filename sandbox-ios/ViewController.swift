//
//  ViewController.swift
//  sandbox-ios
//
//  Created by bookair18 on 2022/09/27.
//

import UIKit

class ViewController: UIPageViewController {

  var controllers: [UIViewController] = []
  var pageControl: UIPageControl!

  override func viewDidLoad() {
    super.viewDidLoad()

    let redVC = UIViewController()
    redVC.view.backgroundColor = .red

    let blueVC = UIViewController()
    blueVC.view.backgroundColor = .blue

    controllers = [redVC, blueVC]
    setViewControllers([controllers[0]], direction: .forward, animated: true, completion: nil)
    self.dataSource = self

    pageControl = UIPageControl(
      frame: CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 50)
    )
    pageControl.numberOfPages = controllers.count
    pageControl.currentPage = 0
    self.view.addSubview(pageControl)
  }

}


// MARK: - UIPageViewControllerDataSource
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

// MARK: - UIPageViewControllerDataSource
extension ViewController: UIPageViewControllerDataSource {
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return controllers.count
  }

   func pageViewController(
     _ pageViewController: UIPageViewController,
     viewControllerBefore viewController: UIViewController
   ) -> UIViewController? {
     var index = controllers.firstIndex(of: viewController)!
     pageControl.currentPage = index
     index = index - 1

     if index < 0 {
       return nil
     }

     return controllers[index]
   }

  func pageViewController(
    _ pageViewController: UIPageViewController,
     viewControllerAfter viewController: UIViewController
  ) -> UIViewController? {
    var index = controllers.firstIndex(of: viewController)!
    pageControl.currentPage = index

    if index == controllers.count - 1 {
      return nil
    }

    index = index + 1
    return controllers[index]
  }
}
