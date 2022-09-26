//
//  PickerDemoView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/26/22.
//

import SwiftUI

struct PickerDemoView: View {
    @State var selectedIndex = "1"
    var body: some View {
        VStack {
            Picker("Pick Me", selection: $selectedIndex) {
                Text("Pick 1").tag("1")
                Text("Pick 2").tag("2")
                Text("Pick 3").tag("3")
            }
            .pickerStyle(SegmentedPickerStyle())
            Text("You've selected: \(selectedIndex)")
        }
    }
}

struct PickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PickerDemoView()
    }
}
