//
//  MenuView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/26/22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuList: RecipeModel
    @State var locationOption = "Chicago"
    @State var menuOption = "Eggplant Parmesan"
    @State var timeOption = "5 PM"

    var locationList = ["Chicago", "Los Angeles", "Honolulu", "New York City"]

    var timeList = ["5 PM", "6 PM", "7 PM", "8 PM", "9 PM"]
    var body: some View {

        VStack(alignment: .leading, spacing: 0.0) {

            Text("Ottimo Ristorante")
                .padding(.leading, 20.0)
                .padding(.top, 40.0)
                .font(.largeTitle)
                .bold()
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0.0) {
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
                    Text("Order:")
                        .padding(.bottom, 20)
                        .font(.title)
                    Picker("Order", selection: $menuOption) {
                        ForEach(menuList.recipes) { menu in
                            Text(menu.name).tag(menu.name)
                        }
                    }.pickerStyle(WheelPickerStyle())
                        .padding(.bottom, 20)
                    Text("Pickup Time:")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                        .font(.title)

                    Picker("PickupTime", selection: $timeOption) {
                        ForEach(timeList, id: \.self) { time in
                            Text(time).tag(time)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                    Text("Your will pickup your \(menuOption) from our restaurant in \(locationOption) at \(timeOption)")
                        .frame(height: 50)
                }.padding(.bottom, 20)
                GeometryReader { geo in
                    VStack(alignment: .center) {
                        Button("Pick for Me!") {
                            locationOption = locationList[Int.random(in: 0 ..< locationList.count)]

                            menuOption = menuList.recipes[Int.random(in: 0 ..< menuList.recipes.count)].name
                            timeOption = timeList[Int.random(in: 0 ..< timeList.count)]
                        }.bold()
                            .buttonStyle(.bordered)

                    }.frame(width: geo.size.width)
                }
            }
            .padding(.all, 20.0)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(RecipeModel())
    }
}
