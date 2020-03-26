//
//  Date+Ext.swift
//  Revealed
//
//  Created by Hong on 26/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation
extension Date {
  var relativeDateString: String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full

    return formatter.localizedString(for: self, relativeTo: Date())
  }
}
