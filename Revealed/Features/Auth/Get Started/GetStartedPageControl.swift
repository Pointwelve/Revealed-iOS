//
//  GetStartedPageControl.swift
//  Revealed
//
//  Created by Li Hao Lai on 21/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI
import UIKit

struct GetStartedPageControl: UIViewRepresentable {
  typealias UIViewType = UIPageControl

  var numberOfPages: Int

  @Binding var currentPage: Int

  func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl()
    control.numberOfPages = numberOfPages
    control.addTarget(context.coordinator,
                      action: #selector(Coordinator.updateCurrentPage(sender:)),
                      for: .valueChanged)
    control.currentPageIndicatorTintColor = .black
    control.pageIndicatorTintColor = .lightGray

    return control
  }

  func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject {
    var control: GetStartedPageControl

    init(_ control: GetStartedPageControl) {
      self.control = control
    }

    @objc func updateCurrentPage(sender: UIPageControl) {
      control.currentPage = sender.currentPage
    }
  }
}
