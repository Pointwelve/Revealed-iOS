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
  @ObservedObject var viewModel: CreatePostViewModel
  @State private var selectedSubject: String = ""
  @State private var selectedContent: String = ""
  @State private var selectedTopic: Int = 0
  @State private var selectedTag: Int = 0

  private var cancellable: AnyCancellable?

  init(viewModel: CreatePostViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    NavigationView {
//      Form {
//        Section {
//          VStack(alignment: .leading) {
//            Picker(selection: $selectedTopic, label: Text("Select Topic:")) {
//              ForEach(0..<viewModel.topicAndTag.topics.count, id: \.self) {
//                Text(self.viewModel.topicAndTag.topics[$0].name).tag($0)
//              }
//            }
//          }
//        }
//
//        Section {
//          VStack(alignment: .leading) {
//            Picker(selection: $selectedTag, label: Text("Select Tag")) {
//              ForEach(0..<viewModel.topicAndTag.tags.count, id: \.self) {
//                Text(self.viewModel.topicAndTag.tags[$0].name).tag($0)
//              }
//            }
//          }
//        }
//      }
      VStack(alignment: .leading) {
        Text("Create post in NTUC")
          .foregroundColor(Color.gray)

        OrganisationSelectionView()

        TextView(text: $selectedSubject)

        TextField("Your subject", text: $selectedSubject)

        Divider()

        TextField("Your content", text: $selectedContent)
          .foregroundColor(Color.gray)
      }
      .padding()
      .navigationBarTitle("Create Post", displayMode: .inline)
      .navigationBarItems(leading:
        Button("Cancel") {}.foregroundColor(.black),
                          trailing:
        Button("Done") {
          self.viewModel.createPostSubject.send(PostInput(subject: self.selectedSubject,
                                                          content: self.selectedContent,
                                                          topicId: self.viewModel.topicAndTag.topics[self.selectedTopic].id,
                                                          tagIds: [self.viewModel.topicAndTag.tags[self.selectedTag].id]))
        }.foregroundColor(.black)
          .font(.headline))
    }
  }
}

struct CreatePostView_Previews: PreviewProvider {
  static var previews: some View {
    return CreatePostView(viewModel: CreatePostViewModel(isPresented: .constant(true),
                                                         posts: .constant([])))
  }
}

struct OrganisationSelectionView: View {
  var body: some View {
    HStack {
      Image("Icon")
        .padding()

      VStack(alignment: .leading) {
        Text("NTUC")

        Text("3,432 users")
      }

      Spacer()

      Image(systemName: "chevron.right")
        .padding()
    }.background(Color.gray
//      Image("Icon")
//        .resizable()
//        .scaledToFill()
//        .blur(radius: 20.0)
    ).cornerRadius(16.0)
  }
}
