//
//  HomeView.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Combine
import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
  @State var isCreatePostPresented = false
  var body: some View {
    List(viewModel.posts) { post in
      PostRow(post: post.fragments.postDetail)
    }
    .navigationBarTitle(Text("Home"))
    .navigationBarItems(trailing: Button(action: {
      self.isCreatePostPresented = true
    }) {
      Image(systemName: "plus")
        .imageScale(.large)
    })
    .sheet(isPresented: $isCreatePostPresented,
           content: { CreatePostView(isPresented: self.$isCreatePostPresented) })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
