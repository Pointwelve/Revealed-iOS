//
//  Comment+Domain.swift
//  Revealed
//
//  Created by KokHong on 10/5/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation

extension CommentDetail: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

enum CommentError: Error {
  case requestError
}
