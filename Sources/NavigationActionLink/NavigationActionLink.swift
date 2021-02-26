//
//  NavigationActionLink.swift
//  Pace WatchKit Extension
//
//  Created by Conor Wade on 26/02/2021.
//

import SwiftUI

struct NavigationActionLink<Label, Destination>: View where Label: View, Destination: View {
    let destination: Destination
    let action: (() -> Void)?
    let label: () -> Label

    @State private var navigate = false

    init(
        destination: Destination,
        action: (() -> Void)?,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.destination = destination
        self.action = action
        self.label = label
    }

    init(
        destination: Destination,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.destination = destination
        self.action = nil
        self.label = label
    }

    var body: some View {
        Button(action: {
            if let action = action { action() }
            navigate.toggle()
        }) {
            label()
            NavigationLink(
                destination: destination,
                isActive: $navigate
            ) {
                label()
            }
            .hidden()
            .frame(width: 0, height: 0)
        }
    }
}

struct NavigationAction_Previews: PreviewProvider {
    static var previews: some View {
        NavigationActionLink(destination: Text("Destination")) {
            Text("Button")
        }
    }
}
