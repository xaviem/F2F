//
//  EventCreationView.swift
//  F2F
//
//  Created by apprenant15 on 31/01/2023.
//

import SwiftUI

import SwiftUI

struct EventCreationView: View {
    @State var showAlert = false
    @State var adressText = ""
    @State var descriptionText = ""
    @State var price = ""
    @State var duration = ""
    @State var date = Date()
    @State var menuText = "Selectionnez un thème"
    @State var menuActivityText = "Selectionnez une activité"
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            VStack {
                HStack(alignment : .top){
                    VStack{
                        Menu {
                            ForEach(categories){ categorie in
                                Button(categorie.nom, action:{
                                    menuText = categorie.nom
                                    menuActivityText = "Selectionnez une activité"
                                })
                            }
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("boutonVert"))
                                Text(menuText)
                                    .foregroundColor(.black)
                                    .font(.system(size: 500))
                                    .minimumScaleFactor(0.01)
                            }
                            .frame(width: 180, height: 40)
                            .padding()
                        }
                        if !(menuText=="Selectionnez un thème"||menuText=="Autres"){
                            VStack{
                                Menu {
                                    if menuText=="Sports"{
                                        ForEach(categories[1].theme){sport in
                                            MenuButton(menuText: $menuActivityText, text: sport.nom)
                                        }
                                    }
                                    if menuText=="Culture"{
                                        ForEach(categories[2].theme){culture in
                                            MenuButton(menuText: $menuActivityText, text: culture.nom)
                                        }
                                    }
                                    if menuText=="Jeux"{
                                        ForEach(categories[0].theme){jeu in
                                            MenuButton(menuText: $menuActivityText, text: jeu.nom)
                                        }
                                    }
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(Color("boutonVert"))
                                        Text(menuActivityText)
                                            .foregroundColor(.black)
                                            .font(.system(size: 500))
                                            .minimumScaleFactor(0.01)
                                    }
                                    .frame(width: 180, height: 40)
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                Divider()
                HStack{
                    Image("hourglass")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextZone(text : $duration, indication : "Durée(min)", size : (120,60))
                        .keyboardType(.numberPad)
                    Spacer()
                    Image("euro")
                        .resizable()
                        .frame(width: 50, height: 50)
                    TextZone(text : $price, indication : "Prix", size : (80,60))
                        .keyboardType(.numberPad)
                }
                .padding()
                DatePicker(selection: $date, label: {
                    HStack {
                        Image("calendar")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Date de l'évenement")
                            .font(.system(size : 14))
                    }
                })
                .environment(\.locale, Locale.init(identifier: "fr"))
                Divider()
                TextZone(text: $adressText, indication: "Adresse",size : (360,80))
                Divider()
                TextZone(text: $descriptionText, indication: "cherche 3 personnes pour un tennis", size : (360,130))
                Button{
                    if isConnected{
                        let e = events+[Evenement(date: date, duree: Int(duration) ?? 0, theme: Theme(nom : menuActivityText,image : ""), description: descriptionText, lieu: adressText, prix: Double(price) ?? 0, leader: membres[0], membresId: [membres[0].id])]
                        events = sort(events: e)
                        showAlert = true
                        presentation.wrappedValue.dismiss()
                    }
                } label: {
                    if !isConnected{
                        NavigationLink(destination : LoginOrSignUpView()){
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("boutonBleu"))
                                Text("Creer")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            .frame(width : 250 ,height : 50)
                            .padding(.top)
                        }
                        .alert("Vous devez d'abord vous connecter", isPresented: $showAlert){
                            Button("OK", role: .cancel){}
                        }
                    }
                    else{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("boutonBleu"))
                            Text("Creer")
                                .foregroundColor(.black)
                                .font(.title)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                        .alert("Evenement crée", isPresented: $showAlert){
                            Button("OK", role: .cancel){}
                        }
                    }
                }
            }
            .navigationTitle("Créer un événement")
            .padding()
        }
    }
}
struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}



//
//func customTheme(){
//    VStack {
//        if jeux.theme.contains(theme){
//            menuText = "Selectionnez un thème"
//            menuActivityText = "Selectionnez une activité"
//        }
//        else if sports.theme.contains(theme){
//            menuText = "Selectionnez un thème"
//            menuActivityText = "Selectionnez une activité"
//        }
//        else if cultures.theme.contains(theme){
//            menuText = "Selectionnez un thème"
//            menuActivityText = "Selectionnez une activité"
//        }
//        HStack {
//            Text("Thème : \(theme.nom)")
//            Image(systemName: theme.image)
//        }
//    }
//}
