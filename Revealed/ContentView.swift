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
  @State var goToHome = false

  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(destination: HomeView(), isActive: $goToHome) { EmptyView() }.hidden()
        Button(action: auth) {
          Text("Auth0")
        }
      }
      .navigationBarTitle(Text("Main"))
    }
  }

  private func auth() {
    Auth0
      .webAuth()
      .scope("openid profile offline_access")
      .audience("https://pointwelve.au.auth0.com/userinfo")
      .start {
        switch $0 {
        case let .failure(error):
          // Handle the error
          print("Error: \(error)")
        case let .success(credentials):
            AuthService.shared.store(credentials: credentials)
          self.goToHome = true
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
