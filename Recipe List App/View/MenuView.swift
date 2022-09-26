//
//  MenuView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/26/22.
//

import SwiftUI

struct MenuView: View {
    @State var locationOption = "Chicago"
    @State var menuOption = "Pupusas"
    @State var timeOption = "5 PM"
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Ottimo Ristorante")
                .padding(.leading, 20.0)
                .padding(.top, 40.0)
                .font(.largeTitle)
                .bold()
            VStack(alignment: .leading) {
                HStack {
                    Text("Location: ")
                        .font(.title)

                    Picker("Location", selection: $locationOption) {
                        Text("Chicago").tag("Chicago")
                        Text("Los Angeles").tag("Los Angeles")
                    }
                }
                .padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Order:")
                        .padding(.bottom, 20)
                        .font(.title)
                    Picker("Order", selection: $menuOption) {
                        Text("Pupusas").tag("Pupusas")
                        Text("Pizza").tag("Pizza")
                        Text("Burrito").tag("Burrito")
                    }.pickerStyle(WheelPickerStyle())
                        .padding(.bottom, 20)
                }
                Text("Pickup Time:")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .font(.title)

                Picker("PickupTime", selection: $timeOption) {
                    Text("5 PM").tag("5 PM")
                    Text("6 PM").tag("6 PM")
                    Text("7 PM").tag("7 PM")
                    Text("8 PM").tag("8 PM")
                    Text("9 PM").tag("9 PM")
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 20)

                Text("Your will pickup your \(menuOption) from our restaurant in \(locationOption) at \(timeOption)")
                Spacer()
            }
            .padding(.all, 20.0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
