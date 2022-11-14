import SwiftUI

public struct RadioGroupStyleEnvironmentKey: EnvironmentKey {
    public static var defaultValue: any RadioGroupStyle = AccessoryImageRadioGroupStyle.default()
}

extension EnvironmentValues {
    public var radioGroupStyle: any RadioGroupStyle {
        get { self[RadioGroupStyleEnvironmentKey.self] }
        set { self[RadioGroupStyleEnvironmentKey.self] = newValue }
    }
}

extension View {
    public func radioGroupStyle<Style: RadioGroupStyle>(_ style: Style) -> some View {
        environment(\.radioGroupStyle, style)
    }
}
