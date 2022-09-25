//
//  RectangleView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            GeometryReader { geo in

                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .onTapGesture {
                        print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                        print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                    }
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: geo.size.width * 2 / 3, height: geo.size.height / 4, alignment: .center)
                    .onTapGesture {
                        print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                        print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                    }
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)

            }.ignoresSafeArea()

            GeometryReader { geo in
                HStack(spacing: 0.0) { Rectangle()
                    .foregroundColor(.purple)
                    .frame(width: geo.size.width / 2, height: geo.size.height, alignment: .center)
                    .onTapGesture {
                        print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                        print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                    }
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: geo.size.width / 2, height: geo.size.height, alignment: .center)
                        .onTapGesture {
                            print("global x: \(geo.frame(in: .global).minX) , y: \(geo.frame(in: .global).minY)")
                            print("local x: \(geo.frame(in: .local).minX) , y: \(geo.frame(in: .local).minY)")
                        }
                }

            }.ignoresSafeArea()
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}

//  .offset(x: 30, y: 30)
//  Rectangle()
//  .foregroundColor(.red)
//  .frame(width: 100, height: 100, alignment: .center)
//  .padding([.top, .leading], 30.0)
//  .offset(x: 30, y: 30)
