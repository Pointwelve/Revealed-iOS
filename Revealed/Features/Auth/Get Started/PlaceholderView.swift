//
//  PlaceholderView.swift
//  Revealed
//
//  Created by Li Hao Lai on 21/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI

struct PlaceholderView: View {
  let page: Int

  var body: some View {
    Text("Page: \(page)")
  }
}

struct PlaceholderView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceholderView(page: 1)
  }
}
