//
//  MenuButton.swift
//  F2F
//
//  Created by apprenant15 on 31/01/2023.
//

import SwiftUI

struct MenuButton :View {
    @Binding var menuText : String
    let text : String
    var body : some View {
        Button(text) {
            menuText = text
        }
    }
}
