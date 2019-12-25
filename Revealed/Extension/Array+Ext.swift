//
//  Array+Ext.swift
//  Revealed
//
//  Created by KokHong on 25/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation
extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
