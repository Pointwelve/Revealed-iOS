//
//  ContentView.swift
//  Revealed
//
//  Created by KokHong on 27/11/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Auth0
import SwiftUI

struct ContentView: View {
  @ObservedObject private var auth: AuthService = AuthService.shared

  var body: some View {
    Group {
      Group {
        if auth.credentials != nil {
          HomeView()
        } else {
          GetStartedView([PlaceholderView(page: 1), PlaceholderView(page: 2)])
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
