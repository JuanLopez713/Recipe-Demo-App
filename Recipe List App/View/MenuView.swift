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

    var locationList = ["Chicago", "Los Angeles", "Honolulu", "New York City"]
    var menuList = ["Pupusas", "Pizza", "Tacos", "Burritos"]
    var timeList = ["5 PM", "6 PM", "7 PM", "8 PM", "9 PM"]
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
                        ForEach(locationList, id: \.self) { location in
                            Text(location).tag(location)
                        }
                    }
                }
                .padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Order:")
                        .padding(.bottom, 20)
                        .font(.title)
                    Picker("Order", selection: $menuOption) {
                        ForEach(menuList, id: \.self) { menu in
                            Text(menu).tag(menu)
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .padding(.bottom, 20)
                }
                Text("Pickup Time:")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .font(.title)

                Picker("PickupTime", selection: $timeOption) {
                    ForEach(timeList, id: \.self) { time in
                        Text(time).tag(time)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 20)

                Text("Your will pickup your \(menuOption) from our restaurant in \(locationOption) at \(timeOption)")
                    .padding(.bottom, 20)
                GeometryReader { geo in
                    Button("Pick for Me!") {
                        locationOption = locationList[Int.random(in: 0 ..< locationList.count)]

                        menuOption = menuList[Int.random(in: 0 ..< menuList.count)]
                        timeOption = timeList[Int.random(in: 0 ..< timeList.count)]
                    }.bold().frame(width: geo.size.width, alignment: .center).foregroundColor(.green)
                }
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
