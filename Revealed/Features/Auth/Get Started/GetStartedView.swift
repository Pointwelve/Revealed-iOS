//
//  GetStartedView.swift
//  Revealed
//
//  Created by Li Hao Lai on 21/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Auth0
import SwiftUI

struct GetStartedView<Page: View>: View {
  var viewControllers: [UIHostingController<Page>]

  @State var currentPage = 0

  @State var goToHome = false

  init(_ views: [Page]) {
    viewControllers = views.map { UIHostingController(rootView: $0) }
  }

  var body: some View {
    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
      GetStartedPageViewController(controllers: viewControllers, currentPage: $currentPage)

      VStack {
        GetStartedPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)

        Button(action: auth) {
          Text("Get started")
        }
      }
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

struct GetStartedView_Previews: PreviewProvider {
  static var previews: some View {
    GetStartedView([PlaceholderView(page: 1), PlaceholderView(page: 2)])
  }
}
