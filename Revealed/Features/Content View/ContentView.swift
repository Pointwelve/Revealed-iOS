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
  @EnvironmentObject var appState: AppState

  var body: some View {
    Group {
      contentView()
    }
  }

  private func contentView() -> AnyView {
    switch appState.userState {
    case .home:
      return AnyView(HomeView())
    case .getStarted:
      return AnyView(GetStartedView([PlaceholderView(page: 1), PlaceholderView(page: 2)]))
    case .postSignUp:
      return AnyView(CreateUserView(viewModel: CreateUserViewModel(appState: appState)))
    case .new:
      return AnyView(SplashView())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
