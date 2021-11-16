//
//  EmojiView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 15/11/21.
//

import SwiftUI

struct ColorSwatchView: View {

    @Binding var selection: String

    var body: some View {

        let swatches = [
            ".systemRed",
            ".systemGreen",
            ".systemBlue",
            ".systemYellow",
            ".systemGrey",
            ".systemBlack",
            ".systemPurple",
            ".systemIndigo"
        ]

        let columns = [
            GridItem(.adaptive(minimum: 60))
        ]

        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(swatches, id: \.self){ swatch in
                ZStack {
                    Circle()
                        .fill(Color("\(swatch)"))
                        .frame(width: 50, height: 50)
                        .onTapGesture(perform: {
                            selection = swatch
                        })
                        .padding(10)

                    if selection == swatch {
                        Circle()
                            .stroke(Color(.systemGreen), lineWidth: 5)
                            .frame(width: 60, height: 60)
                    }
                }
            }
        }
        .padding(10)
    }
}

struct ColorSwatchView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatchView(selection: .constant("systemRed"))
    }
}

