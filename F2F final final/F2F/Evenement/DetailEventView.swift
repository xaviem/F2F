//
//  DetailEventView.swift
//  F2F
//
//  Created by apprenant15 on 31/01/2023.
//

import SwiftUI
/*
struct DetailEventView: View {
    let event : Evenement
    @Environment(\.presentationMode) var presentation
    @State var showAlert = false
    @State var textAlert = "Evenement rejoint"
    var body: some View {
        VStack{
            HStack {
                Text("Organisé par : ")
                    .font(.title2)
                Spacer()
            }
            if !(event.leader.id==membres[0].id){
                NavigationLink(destination : DetailProfilView(membre: event.leader)){
                    HStack {
                        Image(event.leader.photo)
                            .resizable()
                            .font(.largeTitle)
                            .frame(width : 60, height : 60)
                            .clipShape(Circle())
                        Text("\(event.leader.prenom) \(event.leader.nom)")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                }
                .foregroundColor(.black)
            }
            else{
                HStack {
                    Image(event.leader.photo)
                        .resizable()
                        .font(.largeTitle)
                        .frame(width : 60, height : 60)
                        .clipShape(Circle())
                    Text("\(event.leader.prenom) \(event.leader.nom)")
                        .font(.title2)
                    Spacer()
                }
                .padding()
                .foregroundColor(.black)
            }
            Divider()
            Group {
                HStack {
                    VStack(alignment: .leading){
                        Text("Catégorie : \(findNameCategory(event : event))")
                            .padding(.bottom)
                        Text("Thème : \(event.theme.nom)")
                    }
                    .foregroundColor(.black)
                    .font(.title2)
                    Spacer()
                }
                .padding(.horizontal)
                Divider()
                HStack{
                    Text("Date de l'évenement :")
                    Text(event.date, style : .date)
                }
                .padding(5)
                HStack{
                    Text("Heure :")
                    Text(event.date, style : .time)
                }
                HStack{
                    Image(systemName: "clock.fill")
                        .font(.system(size : 40))
                        .foregroundColor(Color.teal)
                    Text("\(event.duree/60)H\(event.duree%60)")
                    Spacer()
                    Image(systemName: "eurosign.circle.fill")
                        .font(.system(size : 40))
                        .foregroundColor(.yellow)
                    Text("\(String(format : "%.2f",event.prix))€")
                }
                .padding(.horizontal)
                Divider()
                Text(event.lieu)
                    .padding()
                Divider()
            }
            Text("\(event.leader.prenom) \(event.description)")
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical)
            if event.leader.id==membres[0].id{
                Button{
                    if isConnected{
                        for i in 0...events.count-1{
                            if events[i].id==event.id{
                                events[i].membresId.append(membres[0].id)
                                break
                            }
                        }
                        textAlert = "Evenement supprimé"
                        presentation.wrappedValue.dismiss()
                        showAlert = true
                    }
                } label: {
                    if isConnected{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.black)
                            Text("Supprimer l'événement")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                    }
                    else{
                        NavigationLink(destination : LoginOrSignUpView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("ColorBackgroundButton"))
                                Text("Supprimer l'événement")
                                    .foregroundColor(Color("ColorTextButton"))
                                    .font(.title2)
                            }
                            .frame(width : 250 ,height : 50)
                            .padding(.top)
                        }
                    }
                }
                .alert(textAlert, isPresented: $showAlert){
                    Button("OK", role: .cancel){}
                }
            }
            else if isParticipating(){
                Button{
                    if isConnected{
                        for i in 0...events.count-1{
                            if events[i].id==event.id{
                                events[i].membresId.append(membres[0].id)
                                break
                            }
                        }
                        textAlert = "Evenement quitté"
                        presentation.wrappedValue.dismiss()
                        showAlert = true
                    }
                } label: {
                    if isConnected{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.black)
                            Text("Quitter l'événement")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                    }
                    else{
                        NavigationLink(destination : LoginOrSignUpView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("ColorBackgroundButton"))
                                Text("Quitter l'événement")
                                    .foregroundColor(Color("ColorTextButton"))
                                    .font(.title2)
                            }
                            .frame(width : 250 ,height : 50)
                            .padding(.top)
                        }
                    }
                }
                .alert(textAlert, isPresented: $showAlert){
                    Button("OK", role: .cancel){}
                }
            }
            else{
                Button{
                    if isConnected{
                        for i in 0...events.count-1{
                            if events[i].id==event.id{
                                events[i].membresId.append(membres[0].id)
                                break
                            }
                        }
                        textAlert = "Evenement Rejoint"
                        presentation.wrappedValue.dismiss()
                        showAlert = true
                    }
                } label: {
                    if isConnected{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.black)
                            Text("Rejoindre l'événement")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                    }
                    else{
                        NavigationLink(destination : LoginOrSignUpView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("ColorBackgroundButton"))
                                Text("Rejoindre l'événement")
                                    .foregroundColor(Color("ColorTextButton"))
                                    .font(.title2)
                            }
                            .frame(width : 250 ,height : 50)
                            .padding(.top)
                        }
                    }
                }
                .alert(textAlert, isPresented: $showAlert){
                    Button("OK", role: .cancel){}
                }
            }
        }
        .navigationTitle("Détail de l'événement")
        .padding()
    }
    

    
    func isParticipating() -> Bool{
        for e in events{
            if e.membresId.contains(membres[0].id) && e.id==event.id{
                return true
            }
        }
        return false
    }
}*/


import SwiftUI

struct DetailEventView: View {
    let event : Evenement
    @Environment(\.presentationMode) var presentation
    @State var showAlert = false
    @State var textAlert = "Evenement rejoint"
    var body: some View {
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            VStack (alignment: .center){
                HStack {
                    Text("Organisé par : ")
                        .font(.title)
                    Spacer()
                }
                if !(event.leader.id==membres[0].id){
                    NavigationLink(destination : DetailProfilView(membre: event.leader)){
                        HStack {
                            Image(event.leader.photo)
                                .resizable()
                                .font(.largeTitle)
                                .frame(width : 60, height : 60)
                                .clipShape(Circle())
                            Text("\(event.leader.prenom) \(event.leader.nom)")
                                .font(.title2)
                            Spacer()
                        }
                        .padding()
                    }
                    .foregroundColor(.black)
                }
                else{
                    HStack {
                        Image(event.leader.photo)
                            .resizable()
                            .font(.largeTitle)
                            .frame(width : 60, height : 60)
                            .clipShape(Circle())
                        Text("\(event.leader.prenom) \(event.leader.nom)")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                Spacer()
                    .frame(height:30)
                
                //Color("BgDetailProfil")
                //  .frame(width: 400, height: 90)
                //.cornerRadius(25)
                HStack{
                    Spacer()
                    VStack (alignment: .center) {
                        Text("\(event.leader.nombreEvenementsOrganises)")
                            .fontWeight(.bold)
                            .font(.system(size: 26))
                        Text("événements")
                        Text("organisés")
                        
                    }
                    Spacer()
                    VStack{
                        Text(event.theme.nom)
                            .bold()
                        Image(event.theme.image)
                            .resizable()
                            .frame(width : 30, height : 30)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                Divider()
                //Spacer()
                //.frame(height:30)
                ZStack {
                    
                    VStack{
                        HStack{
                            HStack{
                                Image("calendar")
                                    .resizable()
                                    .frame(width:40, height:40)
                                Text(event.date, style : .date)
                            }
                            Spacer()
                            HStack{
                                Image("clock")
                                    .resizable()
                                    .frame(width:40, height:40)
                                Text(event.date, style : .time)
                            }
                        }
                        
                        HStack{
                            HStack{
                            Image("hourglass")
                                .resizable()
                                .frame(width:40, height:40)
                                Text("\(event.duree/60)H\(event.duree%60)")}
                           Spacer()
                            HStack{
                                Image("euro")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(String(format : "%.2f",event.prix))€")}
                        }
                        HStack{
                            Image("map")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(event.lieu)
                                .padding()
                            
                        }
                   
                    }
                }
                
                Text("\(event.leader.prenom) \(event.description)")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical)
                if event.leader.id==membres[0].id{
                    Button{
                        var ev = events
                        for i in 0...events.count-1{
                            if events[i].id==event.id{
                                ev.remove(at: i)
                            }
                        }
                        events = ev
                        textAlert = "Evenement supprimé"
                        presentation.wrappedValue.dismiss()
                        showAlert = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("boutonBleu"))
                            Text("Supprimer l'événement")
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                    }
                    .alert(textAlert, isPresented: $showAlert){
                        Button("OK", role: .cancel){}
                    }
                }
                else{
                    Button{
                        for i in 0...events.count-1{
                            if events[i].id==event.id{
                                if !events[i].membresId.contains(membres[0].id)
                                {
                                    events[i].membresId.append(membres[0].id)
                                }
                                else{
                                    textAlert = "Vous êtes déja inscrit"
                                }
                            }
                        }
                        showAlert = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color("boutonBleu"))
                            Text("Rejoindre l'événement")
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                        .frame(width : 250 ,height : 50)
                        .padding(.top)
                    }
                    .alert(textAlert, isPresented: $showAlert){
                        Button("OK", role: .cancel){                    presentation.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Détail de l'événement")
        .padding(30)
        }
        
        
            
    }
    func test() -> String{
        for categorie in categories{
            if categorie.theme.contains(event.theme){
                return categorie.nom
            }
                
        }
        return ""
        
            
    }
        
}



struct DetailEventView_Previews: PreviewProvider {
    @State static var reload = false
    static var previews: some View {
        DetailEventView(event : Evenement(date: Date(), duree: 155, theme: Theme(nom : "FootBall",image : "BallonFoot"), description: "cherche 3 joueurs pour un tennis sans prise de tête.", lieu: "36 rue du cule, MontCuq, 46201", prix: 3,leader: membres[0], membresId: [membres[0].id]))
    }
}
