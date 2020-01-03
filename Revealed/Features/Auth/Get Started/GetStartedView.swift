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

  init(_ views: [Page]) {
    viewControllers = views.map { UIHostingController(rootView: $0) }
  }

  var body: some View {
    VStack(alignment: .leading) {
      Image("Icon")

      ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        GetStartedPageViewController(controllers: viewControllers, currentPage: $currentPage)

        GetStartedPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
      }
      .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))

      Button(action: auth) {
        Text("Get Started")
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 56, idealHeight: 56, maxHeight: 56)
          .foregroundColor(.white)
          .background(Color(red: 35 / 255, green: 93 / 255, blue: 227 / 255))
          .cornerRadius(10)
      }
    }
    .padding(EdgeInsets(top: 32, leading: 32, bottom: 0, trailing: 32))
  }

  private func auth() {
    Auth0
      .webAuth()
      .scope("openid profile offline_access email")
      .audience("https://pointwelve.au.auth0.com/userinfo")
      .start {
        switch $0 {
        case let .failure(error):
          // Handle the error
          print("Error: \(error)")
        case let .success(credentials):
          AuthService.shared.store(credentials: credentials)
        }
      }
  }
}

struct GetStartedView_Previews: PreviewProvider {
  static var previews: some View {
    GetStartedView([PlaceholderView(page: 1), PlaceholderView(page: 2)])
  }
}
