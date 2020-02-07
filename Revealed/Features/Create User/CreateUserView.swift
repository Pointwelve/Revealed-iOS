//
//  CreateUserView.swift
//  Revealed
//
//  Created by Li Hao Lai on 13/1/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct CreateUserView: View {
  @State private var username: String = ""
  @State private var companyName: String = ""

  var body: some View {
    VStack(alignment: .leading) {
      Image("Icon")

      TextField("Username", text: $username)
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

      TextField("Company name", text: $companyName)
        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

      Button(action: {}) {
        Text("Join Reveald")
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 56, idealHeight: 56, maxHeight: 56)
          .foregroundColor(.white)
          .background(Color(red: 35 / 255, green: 93 / 255, blue: 227 / 255))
          .cornerRadius(10)
      }
    }
    .padding(EdgeInsets(top: 32, leading: 32, bottom: 0, trailing: 32))
  }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
