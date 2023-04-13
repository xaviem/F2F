//
//  TextZone.swift
//  F2F
//
//  Created by apprenant15 on 29/01/2023.
//

import SwiftUI

struct TextZone: View {
    @Binding var text : String
    var indication : String = ""
    var size : (CGFloat,CGFloat) = (0,0)
    var body: some View {
        if !(size == (0,0)){
            ZStack{
                if !(size == (0,0)){
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red : 0.8,green : 0.8, blue : 0.8))
                    }
                else{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red : 0.8,green : 0.8, blue : 0.8))
                }
                VStack{
                    TextField(indication, text: $text, axis: .vertical)//Faudra trouver comment écrir sur plusieurs lignes
                        .padding()
                        .environment(\.locale, Locale.init(identifier: "fr"))
                    Spacer()
                }
            }
            .frame(width : size.0, height : size.1)
            }
        else{
            ZStack{
                if !(size == (0,0)){
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red : 0.8,green : 0.8, blue : 0.8))
                    }
                else{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red : 0.8,green : 0.8, blue : 0.8))
                }
                VStack{
                    TextField(indication, text: $text, axis: .vertical)//Faudra trouver comment écrir sur plusieurs lignes
                        .padding()
                        .environment(\.locale, Locale.init(identifier: "fr"))

                    Spacer()
                }
            }
        }
    }
}


struct TextZone_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        TextZone(text : $text, indication: "gfvd")
    }
}
