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

        TextView(placeholder: "Your subject", text: $selectedSubject)
          .frame(numLines: 2)

        Divider()

        TextView(placeholder: "Your content", text: $selectedContent)

        TagsBarView()
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
        .padding(10)

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

struct TagsBarView: View {
  var brown = Color(red: 87 / 255,
                    green: 71 / 255,
                    blue: 49 / 255,
                    opacity: 1.0)

  var lightBrown = Color(red: 251 / 255,
                         green: 246 / 255,
                         blue: 239 / 255,
                         opacity: 1.0)

  var borderBrown = Color(red: 182 / 255,
                          green: 157 / 255,
                          blue: 122 / 255,
                          opacity: 1.0)

  var body: some View {
    VStack {
      Divider()
        .padding(.bottom, 10)

      HStack {
        Image(systemName: "tag")
          .foregroundColor(brown)

        Button(action: {}) {
          Text("+ tag")
            .font(.system(size: 15))
            .foregroundColor(brown)
            .padding(.top, 3)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.bottom, 3)
        }.background(lightBrown)
          .cornerRadius(13)
          .overlay(
            RoundedRectangle(cornerRadius: 13)
              .strokeBorder(
                style: StrokeStyle(lineWidth: 1,
                                   dash: [5])
              )
              .foregroundColor(borderBrown)
          )

        Spacer()
      }

      Divider()
        .padding(.top, 10)
    }
  }
}
