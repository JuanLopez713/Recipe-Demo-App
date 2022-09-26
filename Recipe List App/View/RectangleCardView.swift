//
//  RectangleCardView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RectangleCardView: View {
    var randImage = ["1.circle", "2.circle", "3.circle", "4.circle", "5.circle", "6.circle", "7.circle", "8.circle", "9.circle", "10.circle"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Swipeable Rectangles")
                .font(.largeTitle)
                .padding([.leading, .bottom])
            GeometryReader { geo in
                TabView {
                    ForEach(0 ... 50, id: \.self) { _ in
                        let randRed = Double.random(in: 0 ..< 1)
                        let randGreen = Double.random(in: 0 ..< 1)
                        let randBlue = Double.random(in: 0 ..< 1)
                        let randOpa = Double.random(in: 0 ..< 1)
                        let randNumImage = Int.random(in: 0 ..< 10)
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(.sRGB, red: randRed, green: randGreen, blue: randBlue, opacity: randOpa))
                                .frame(width: geo.size.width * 3 / 4, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                            Image(systemName: randImage[randNumImage])
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 2 / 3, alignment: .center)
                        }
                    }

                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView()
    }
}
