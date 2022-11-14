import SwiftUI

public protocol RadioGroupStyle {
    associatedtype ItemView: View
    func makeView(label: String, isSelected: Bool) -> ItemView
}

extension RadioGroupStyle {
    public static func `default`() -> Self where Self == AccessoryImageRadioGroupStyle {
        Self.checkbox()
    }
    public static func checkbox() -> Self where Self == AccessoryImageRadioGroupStyle {
        .init(accessoryImage: Image(systemName: "square"), accessoryImageSelected: Image(systemName: "checkmark.square"))
    }
    public static func leadingCheck() -> Self where Self == AccessoryImageRadioGroupStyle {
        .init(accessoryImageSelected: Image(systemName: "checkmark"))
    }
    public static func trailingCheck() -> Self where Self == AccessoryImageRadioGroupStyle {
        .init(accessoryImageSelected: Image(systemName: "checkmark"), accessoryIsLeading: false)
    }
    public static func roundedRect() -> Self where Self == ButtonRadioGroupStyle {
        .init()
    }
    public static func pill() -> Self where Self == ButtonRadioGroupStyle {
        .init(cornerRadius: .greatestFiniteMagnitude)
    }
    public static func rect() -> Self where Self == ButtonRadioGroupStyle {
        .init(cornerRadius: 0)
    }
}
