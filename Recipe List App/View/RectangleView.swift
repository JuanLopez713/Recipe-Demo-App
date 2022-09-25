//
//  RectangleView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Rectangle()
                    .frame(width: geo.size.width / 4, height: geo.size.height / 7, alignment: .center)
                    .onTapGesture {
                        print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                        print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                    }
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: geo.size.width / 4, height: geo.size.height / 7, alignment: .center)
                    .onTapGesture {
                        print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                        print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                    }
            }
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
