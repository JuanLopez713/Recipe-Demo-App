//
//  RectangleCardView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RectangleCardView: View {
    @State var flipRectangle = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Swipeable Rectangles")
                .padding(.top, 40.0)
                .padding(.leading, 20)
                .font(.largeTitle)
                .bold()

            if flipRectangle {
                RectangleHorizontalView()
            } else {
                RectangleVerticalView()
            }
            Toggle("Flip Rectangles", isOn: $flipRectangle)
                .padding(20.0)
        }
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView()
    }
}
