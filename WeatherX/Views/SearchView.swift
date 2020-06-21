//
//  SearchView.swift
//  WeatherX
//
//  Created by Fillipi Paiva Suszek on 21/06/20.
//  Copyright © 2020 Fillipi Paiva Suszek. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State var text: String
    
    var body: some View {
        HStack {
            TextField("City", text: $text).modifier(ClearButton(text: $text))//.modifier(ClearButton(text: $text))
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                // Search Button
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                
            }
            .frame(width: 50, height: 50)
        }
        .padding()
    }
}

struct ClearButton: ViewModifier {
    
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: "")
            .previewLayout(.sizeThatFits)
    }
}
