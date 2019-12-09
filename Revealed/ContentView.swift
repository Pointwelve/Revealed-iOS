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
  var body: some View {
    NavigationView {
      Button(action: auth) {
        Text("Auth0")
      }
    }
  }

  private func auth() {
    Auth0
      .webAuth()
      .scope("openid profile")
      .audience("https://pointwelve.au.auth0.com/userinfo")
      .start {
        switch $0 {
        case let .failure(error):
          // Handle the error
          print("Error: \(error)")
        case let .success(credentials):
          // Do something with credentials e.g.: save them.
          // Auth0 will automatically dismiss the login page
          print("Credentials: \(credentials)")
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
