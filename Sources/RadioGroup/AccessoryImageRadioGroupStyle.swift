import SwiftUI

public struct AccessoryImageRadioGroupStyle: RadioGroupStyle {
    private var accessoryImage: Image? = nil
    private var accessoryImageSelected: Image
    private var accessoryIsLeading = true
    private var verticalAlignment: VerticalAlignment = .center
    private var spacing: CGFloat? = nil
    public init(
        accessoryImage: Image? = nil,
        accessoryImageSelected: Image,
        accessoryIsLeading: Bool = true,
        verticalAlignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil
    ) {
        self.accessoryImage = accessoryImage
        self.accessoryImageSelected = accessoryImageSelected
        self.accessoryIsLeading = accessoryIsLeading
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
    }
    public func makeView(label: String, isSelected: Bool) -> some View {
        HStack(alignment: verticalAlignment, spacing: spacing) {
            if accessoryIsLeading {
                accessoryView(for: isSelected)
                Text(label)
            } else {
                Text(label)
                accessoryView(for: isSelected)
            }
        }
    }
    @ViewBuilder
    private func accessoryView(for isSelected: Bool) -> some View {
        if isSelected {
            accessoryImageSelected
        } else if let accessoryImage {
            accessoryImage
        } else {
            accessoryImageSelected.opacity(0)
        }
    }
}
