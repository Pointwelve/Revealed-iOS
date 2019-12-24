//
//  CreatePostView.swift
//  Revealed
//
//  Created by KokHong on 24/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI

struct CreatePostView: View {
  @Binding var isPresented: Bool
  @ObservedObject var viewModel: CreatePostViewModel = CreatePostViewModel()
  @State private var selectedSubject: String = ""
  @State private var selectedContent: String = ""
  @State private var selectedTopic = Topic.default
  @State private var selectedTag = Tag.default

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
            Picker(selection: $selectedTopic.name, label: Text("Select Topic")) {
              ForEach(viewModel.topics) {
                Text($0.name)
              }
            }
          }
        }

        Section {
          VStack(alignment: .leading) {
            Picker(selection: $selectedTag.name, label: Text("Select Tag")) {
              ForEach(viewModel.tags) {
                Text($0.name).tag($0.id)
              }
            }
          }
        }

        Button(action: {
          self.viewModel.createPostSubject.send(PostInput(subject: self.selectedSubject,
                                                          content: self.selectedContent,
                                                          topicId: self.selectedTopic.id,
                                                          tagIds: [self.selectedTag.id]))
          
          self.isPresented = self.viewModel.newPost == nil
        }) {
          Text("Create Post")
        }
      }.navigationBarTitle("Create Post")
      
      
    }
  }
}

//struct CreatePostView_Previews: PreviewProvider {
//  static var previews: some View {
//    CreatePostView(isPresented: <#Binding<Bool>#>)
//  }
//}
