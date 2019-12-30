//
//  CreatePostView.swift
//  Revealed
//
//  Created by KokHong on 24/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Combine
import SwiftUI

struct CreatePostView: View {
  @Binding var isPresented: Bool
  @ObservedObject var viewModel: CreatePostViewModel = CreatePostViewModel()
  @State private var selectedSubject: String = ""
  @State private var selectedContent: String = ""
  @State private var selectedTopic: Int = 0
  @State private var selectedTag: Int = 0

  private var cancellable: AnyCancellable?

  init(isPresented: Binding<Bool>) {
    _isPresented = isPresented
    cancellable = viewModel.$newPost.filter { $0 != nil }
      .map { _ in false }
      .assign(to: \.isPresented, on: self)
  }

  var body: some View {
    NavigationView {
      Form {
        Section {
          VStack(alignment: .leading) {
            HStack {
              Text("Subject:")
              TextField("Your subject", text: $selectedSubject)
            }
            HStack {
              Text("Content:")
              TextField("Your content", text: $selectedContent)
            }
          }
        }

        Section {
          VStack(alignment: .leading) {
            Picker(selection: $selectedTopic, label: Text("Select Topic:")) {
              ForEach(0..<viewModel.topicAndTag.topics.count, id: \.self) {
                Text(self.viewModel.topicAndTag.topics[$0].name).tag($0)
              }
            }
          }
        }

        Section {
          VStack(alignment: .leading) {
            Picker(selection: $selectedTag, label: Text("Select Tag")) {
              ForEach(0..<viewModel.topicAndTag.tags.count, id: \.self) {
                Text(self.viewModel.topicAndTag.tags[$0].name).tag($0)
              }
            }
          }
        }

        Button(action: {
          self.viewModel.createPostSubject.send(PostInput(subject: self.selectedSubject,
                                                          content: self.selectedContent,
                                                          topicId: self.viewModel.topicAndTag.topics[self.selectedTopic].id,
                                                          tagIds: [self.viewModel.topicAndTag.tags[self.selectedTag].id]))

        }) {
          Text("Create Post")
        }
      }.navigationBarTitle("Create Post")
    }
  }
}

struct CreatePostView_Previews: PreviewProvider {
  static var previews: some View {
    return CreatePostView(isPresented: .constant(true))
  }
}
