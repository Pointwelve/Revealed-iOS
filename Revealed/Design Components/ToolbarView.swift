import SwiftUI

protocol ToolbarItemModel {
  typealias Action = () -> Void
  
  var iconName: String { get }
  var title: String { get }
  var isSelected: Bool { get }
  var foregroundColor: Color { get }
  var selectedColor: Color { get }
  var action: Action? { get }
}

extension ToolbarItemModel {
  var foregroundColor: Color {
    return .primary
  }
  
  var selectedColor: Color {
    return .red
  }
}

struct ToolbarView: View {
  let leftItems: [ToolbarItemModel]
  let rightItems: [ToolbarItemModel]
  let spacing = CGFloat.medium
  
  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      // Add left items
      ForEach(0..<self.leftItems.count) { index in
        ItemView(model: self.leftItems[index])
      }
      
      Spacer()
      
      // Add right items
      ForEach(0..<self.rightItems.count) { index in
        ItemView(model: self.rightItems[index])
      }
    }
  }
}

extension ToolbarView {
  struct ItemView: View {
    let model: ToolbarItemModel
    let spacing = CGFloat.xsmall
    
    var body: some View {
      HStack(alignment: .center, spacing: spacing) {
        Image(systemName: model.iconName)
          .foregroundColor(model.foregroundColor)
        
        if model.action != nil {
          Button(model.title, action: model.action!)
            .foregroundColor(model.isSelected ? model.selectedColor : model.foregroundColor)
            .font(.system(.caption, design: .rounded))
        } else {
          Text(model.title)
            .foregroundColor(model.foregroundColor)
            .font(.system(.caption, design: .rounded))
        }
      }
    }
  }
}
