import SwiftUI

public  struct ButtonRadioGroupStyle: RadioGroupStyle {
    private var selectedColor: Color
    private var unselectedColor: Color
    private var selectedTextColor: Color
    private var unselectedTextColor: Color
    private var cornerRadius: CGFloat
    private var padding: CGFloat
    public init(
        selectedColor: Color = .accentColor,
        unselectedColor: Color = Color(uiColor: .tertiarySystemFill),
        selectedTextColor: Color = .white,
        unselectedTextColor: Color = Color(uiColor: .tertiaryLabel),
        cornerRadius: CGFloat = 10,
        padding: CGFloat = 10
    ) {
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self.cornerRadius = cornerRadius
        self.padding = padding
    }
    public func makeView(label: String, isSelected: Bool) -> some View {
        Text(label)
            .foregroundColor(isSelected ? selectedTextColor : unselectedTextColor)
            .padding(padding)
            .background(isSelected ? selectedColor : unselectedColor)
            .cornerRadius(cornerRadius)
    }
}
