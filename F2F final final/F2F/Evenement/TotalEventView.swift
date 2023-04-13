//
//  TotalEventView.swift
//  F2F
//
//  Created by apprenant15 on 31/01/2023.
//

import SwiftUI

struct ThemeEventView: View {
    var theme : Theme
    @State var reload = false
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ScrollView{
            ZStack {
                Color("fondClair")
                    .ignoresSafeArea()
                VStack(spacing : 0){
                    ForEach(events){event in
                        if theme == event.theme{ //theme par defaut donc pas de theme
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: findNameCategory(event: event)=="Sports" ? 1 : 0,
                                                           green: findNameCategory(event: event)=="Cultures" ? 1 : 0,
                                                           blue: findNameCategory(event: event)=="Jeux" ? 1 : 0,
                                                           opacity : 0.3))
                                VStack(alignment: .leading){
                                    Divider()
                                    HStack {
                                        NavigationLink(destination: DetailEventView(event : event)){
                                            Image(event.theme.image)
                                                .resizable()
                                                .frame(width: 40, height: 45)
                                                .padding()
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Text(event.date,style : .date)
                                                    Text(event.date,style : .time)
                                                }
                                                .bold()
                                                Text("\(event.leader.prenom) \(event.description)")
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(theme.nom)
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            NavigationLink(destination : EventCreationView()) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color("boutonBleu"))
                    Text("Creer un événement")
                        .foregroundColor(.black)
                }
            }
        }
        .frame(width : 250, height : 50)
        .padding(.bottom, 8)
    }
}


struct TotalEventView: View {
    @State var reload = false
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationStack{
            ZStack {
                Color("fondClair")
                    .ignoresSafeArea()
                VStack{
                    ScrollView{
                        VStack(spacing : 0){
                            ForEach(events){event in
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color(red: findNameCategory(event: event)=="Sports" ? 1 : 0,
                                                               green: findNameCategory(event: event)=="Cultures" ? 1 : 0,
                                                               blue: findNameCategory(event: event)=="Jeux" ? 1 : 0,
                                                               opacity : 0.3))
                                    VStack(alignment: .leading){
                                        Divider()
                                        HStack {
                                            NavigationLink(destination: DetailEventView(event : event)){
                                                Image(event.theme.image)
                                                    .resizable()
                                                    .frame(width: 40, height: 45)
                                                    .padding()
                                                VStack(alignment: .leading){
                                                    HStack{
                                                        Text(event.date,style : .date)
                                                        Text(event.date,style : .time)
                                                    }
                                                    .bold()
                                                    Text("\(event.leader.prenom) \(event.description)")
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                            .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                            .navigationTitle("Tous les evenements")
                        }
                    }
                    ZStack {
                        Color("fondClair")
                            .ignoresSafeArea()
                        NavigationLink(destination : EventCreationView()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("boutonBleu"))
                                Text("Creer un événement")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .frame(width : 250, height : 50)
                    .padding(.bottom, 8)
                }
            }
        }
    }
}

struct TotalEventView_Previews: PreviewProvider {
    static var previews: some View {
        TotalEventView()
    }
}
