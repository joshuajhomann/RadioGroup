import SwiftUI

public struct RadioGroup<Item, SomeHashable: Hashable, ItemView: View>: View {
    private var items: [Item]
    private var id: KeyPath<Item, SomeHashable>
    @Binding private var selection: Item?
    @Environment(\.radioGroupStyle) private var radioGroupStyle
    private var content: (any RadioGroupStyle, Item, Bool) -> ItemView
    public var body: some View {
        ForEach(items, id: id) { (item: Item) in
            content(radioGroupStyle, item, item[keyPath: id] == selection?[keyPath: id]).onTapGesture { selection = item }
        }
    }
    public init(
        _ items: some Sequence<Item>,
        id: KeyPath<Item, SomeHashable>,
        selection: Binding<Item?>,
        @ViewBuilder content: @escaping (Item, Bool) -> ItemView
    ) {
        self.items = Array(items)
        self.id = id
        _selection = selection
        self.content = { _, item, isSelected in content(item, isSelected) }
    }
    public init(
        _ items: some Sequence<Item>,
        selection: Binding<Item?>,
        @ViewBuilder content: @escaping (Item, Bool) -> ItemView
    ) where Item: Identifiable, Item.ID == SomeHashable {
        self.init(items, id: \.id, selection: selection, content: content)
    }
    public init(
        _ items: some Sequence<Item>,
        id: KeyPath<Item, SomeHashable>,
        description: @escaping ((Item) -> String) = String.init(describing:),
        selection: Binding<Item?>
    ) where ItemView == AnyView {
        self.items = Array(items)
        self.id = id
        _selection = selection
        self.content = { style, item, isSelected in
            AnyView(style.makeView(label: description(item), isSelected: isSelected))
        }
    }
    public init(
        _ items: some Sequence<Item>,
        description: @escaping ((Item) -> String) = String.init(describing:),
        selection: Binding<Item?>
    ) where ItemView == AnyView, Item: Identifiable, Item.ID == SomeHashable {
        self.init(items, id: \.id, description: description, selection: selection)
    }
}
