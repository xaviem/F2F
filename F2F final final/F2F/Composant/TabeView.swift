//
//  TabeView.swift
//  TabView
//
//  Created by Apprenant 29 on 01/02/2023.
//

import SwiftUI

struct TabeView: View {
    @State var tabSelect = 1
    init() {
        UITabBar.appearance().backgroundColor =   UIColor(red : 0, green : 53, blue : 102, alpha: 0)
    }
    var body: some View{
        TabView(selection: $tabSelect){
            NaviView()
                .tabItem{
                    Image(systemName: "soccerball")
                    Text("Themes")
                }
                .tag(1)
            ParamettreChat()
                .tabItem{
                    Image(systemName: "message")
                    Text("Chat")
                }
                .tag(2)
            TotalEventView()
                .tabItem{
                    Image(systemName: "list.bullet.rectangle")
                    Text("évenements")
                }
                .tag(3)
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}


struct TabeView_Previews: PreviewProvider {
    static var previews: some View {
        TabeView()
    }
}
struct ecran: View {
    var couleurforme: Color = .white
    var body: some View {
        Rectangle()
            .foregroundColor(couleurforme)
    }
}
