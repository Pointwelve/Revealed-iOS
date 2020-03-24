//
//  PostDetailViewModel.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation
import Combine

class PostDetailViewModel: ObservableObject, Identifiable {
  private var disposables = Set<AnyCancellable>()

  init() {
  }

  deinit {
    disposables.removeAll()
  }
}
