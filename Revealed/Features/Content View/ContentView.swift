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
  @ObservedObject var viewModel: ContentViewModel = ContentViewModel()

  enum State {
    case home
    case getStarted
    case postSignUp
  }

  var body: some View {
    Group {
      contentView()
    }
  }

  private func contentView() -> AnyView {
    switch viewModel.viewState {
    case .home:
      return AnyView(HomeView())
    case .getStarted:
      return AnyView(GetStartedView([PlaceholderView(page: 1), PlaceholderView(page: 2)]))
    case .postSignUp:
      return AnyView(CreateUserView(viewModel: CreateUserViewModel()))
    case .none:
      return AnyView(SplashView())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
