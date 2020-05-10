//
//  TextField.swift
//  Revealed
//
//  Created by Li Hao Lai on 30/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
  typealias UIViewType = UITextView

  var placeholder: String = "Text View"
  @Binding var text: String

  func makeUIView(context: Context) -> UIViewType {
    let view = UITextView()
    view.textContainer.lineFragmentPadding = 0
    view.textContainerInset = .zero
    view.font = UIFont.systemFont(ofSize: 17)

    view.text = placeholder
    view.textColor = .placeholderText

    return view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
    if !text.isEmpty || uiView.textColor == .label {
      uiView.text = text
      uiView.textColor = .label
    }

    uiView.delegate = context.coordinator
  }

  func frame(numLines: CGFloat) -> some View {
    let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
    return frame(height: height)
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, UITextViewDelegate {
    var parent: TextView

    init(_ parent: TextView) {
      self.parent = parent
    }

    func textViewDidChange(_ textView: UITextView) {
      parent.text = textView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
      if textView.textColor == .placeholderText {
        textView.text = ""
        textView.textColor = .label
      }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
      if textView.text.isEmpty {
        textView.text = parent.placeholder
        textView.textColor = .placeholderText
      }
    }
  }
}
