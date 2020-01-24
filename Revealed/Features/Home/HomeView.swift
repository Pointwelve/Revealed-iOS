//
//  HomeView.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Combine
import SwiftUI
import SwiftUIRefresh

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
  @State var isCreatePostPresented = false
  @State private var isShowing = false
  var body: some View {
    NavigationView {
      List(viewModel.posts) { post in
        PostRow(post: post)
      }
      .pullToRefresh(isShowing: $isShowing) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.viewModel.refresh()
          self.isShowing = false
        }
      }
      .navigationBarTitle(Text("Home"))
      .navigationBarItems(trailing: Button(action: {
        self.isCreatePostPresented = true
      }) {
        Image(systemName: "plus")
          .imageScale(.large)
      })
      .sheet(isPresented: $isCreatePostPresented,
             content: { CreatePostView(viewModel: CreatePostViewModel(isPresented: self.$isCreatePostPresented, posts: self.$viewModel.posts)) })
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
