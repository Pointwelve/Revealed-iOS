//
//  Date+Ext.swift
//  Revealed
//
//  Created by Hong on 26/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation
extension Date {
  func relativeDateString(relativeDate: Date = Date()) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full

    return formatter.localizedString(for: self, relativeTo: relativeDate)
  }
}
