//
//  GetStartedPageViewController.swift
//  Revealed
//
//  Created by Li Hao Lai on 21/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI
import UIKit

struct GetStartedPageViewController: UIViewControllerRepresentable {
  typealias UIViewControllerType = UIPageViewController

  var controllers: [UIViewController]

  @Binding var currentPage: Int

  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                  navigationOrientation: .horizontal)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator

    return pageViewController
  }

  func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
    uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: GetStartedPageViewController

    init(_ pageViewController: GetStartedPageViewController) {
      parent = pageViewController
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return parent.controllers.last
      }
      return parent.controllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count {
        return parent.controllers.first
      }
      return parent.controllers[index + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
}
