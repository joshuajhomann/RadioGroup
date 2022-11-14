//
//  ContentView.swift
//  RadioGroupExample
//
//  Created by Joshua Homann on 11/13/22.
//

import RadioGroup
import SwiftUI


struct ExampleView: View {
    @State var selectedFlavor: String?
    private let flavors = ["Chocolate", "Vanilla", "Strawberry"]

    var body: some View {
        Text(selectedFlavor.map { "You selected: \($0)" } ?? "Select a flavor").font(.title)
            .padding(.vertical)
        VStack(alignment: .leading) {
            RadioGroup(flavors, id:\.self, selection: $selectedFlavor)
        }.radioGroupStyle(.checkbox())
        Divider().padding(.vertical)
        HStack {
            RadioGroup(flavors, id:\.self, selection: $selectedFlavor).radioGroupStyle(.pill())
        }
        Divider().padding(.vertical)
        VStack(alignment: .trailing) {
            RadioGroup(flavors, id:\.self, selection: $selectedFlavor)
        }.radioGroupStyle(.trailingCheck())
        Divider().padding(.vertical)
        RadioGroup(flavors, id:\.self, selection: $selectedFlavor).radioGroupStyle(.roundedRect())
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
