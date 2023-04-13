//
//  ThemesView.swift
//  ThemesView
//
//  Created by Apprenant 29 on 01/02/2023.
//

import SwiftUI

struct NaviView: View {
    @State private var showModal = false // un paramètre qui, en changeant, redéclenche l'affichage; initié à false
    var body: some View {
        NavigationView {
            ZStack {
                Color("fondClair")
                    .ignoresSafeArea()
                ThemesView()
                //Text("Vue Principale")
                    .sheet(isPresented: $showModal, content: {
                        EditProfilView(showModal: $showModal)})// objet test
                // .navigationBarTitle("Thèmes")
                    .navigationBarItems(
                        leading: Button(action: {
                            self.showModal = true
                        }, label: {
                            Image(systemName: "person.circle.fill")
                        }),
                        trailing : NavigationLink(destination : EventMatchView()){
                            Image(systemName: "bolt.heart")
                        }
                    )
            }
        }
    }
}





struct ThemesView: View {
    @State private var RechercheTheme = ""
    @State private var showModal = false // un paramètre qui, en changeant, redéclenche l'affichage
    
    var body: some View {
        
//        NavigationStack{ // ou NavigationView
            SearchBar(text: $RechercheTheme)
            ZStack { //Color("BackgroundApp")
                // .padding(.top, 30)
                //Spacer()
                ScrollView{
                    VStack(alignment: .leading, spacing: 0){
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 1,green: 0,blue: 0,opacity : 0.3))
                            VStack(alignment: .leading){
                                Text("SPORT")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                // début du 1er scroll view
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack{
                                        ForEach(ThemesSport.filter({ theme in
                                            return theme.nom.lowercased()
                                                .contains(RechercheTheme.lowercased())||RechercheTheme.isEmpty
                                        })) {Theme in
                                            NavigationLink {
                                                ThemeEventView(theme : Theme)
                                            }
                                        label: {
                                            Spacer()
                                            HStack{
                                                Spacer()
                                                VStack{
                                                    Image(Theme.image)
                                                        .resizable()
                                                        .cornerRadius(CGFloat(15))
                                                        .frame(width: 80, height: 80)
                                                    Text(Theme.nom)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                }
                                            }
                                        }
                                        }
                                        
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        // bas du 1er scroll Sport
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0,green: 0,blue: 1,opacity : 0.3))
                            VStack(alignment: .leading){
                                Text("JEUX")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack{
                                        ForEach(ThemesJeux.filter({ theme in
                                            return theme.nom.lowercased()
                                                .contains(RechercheTheme.lowercased())||RechercheTheme.isEmpty
                                        })) {Theme in
                                            NavigationLink {
                                                ThemeEventView(theme : Theme)
                                            }
                                        label: {
                                            Spacer()
                                            HStack{
                                                Spacer()
                                                VStack{
                                                    Image(Theme.image)
                                                        .resizable()
                                                        .cornerRadius(CGFloat(15))
                                                        .frame(width: 80, height: 80)
                                                    Text(Theme.nom)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                }
                                            }
                                        }
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        // bas du 2e scroll Sport
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0,green: 1,blue: 0,opacity : 0.3))
                            VStack(alignment: .leading){
                                Text("CULTURE")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack{
                                        ForEach(ThemesCulture.filter({ theme in
                                            return theme.nom.lowercased()
                                                .contains(RechercheTheme.lowercased())||RechercheTheme.isEmpty
                                        })) {Theme in
                                            NavigationLink {
                                                ThemeEventView(theme : Theme)
                                            }
                                            
                                            
                                            
                                        label: {
                                            Spacer()
                                            HStack{
                                                Spacer()
                                                VStack{
                                                    Image(Theme.image)
                                                        .resizable()
                                                        .cornerRadius(CGFloat(15))
                                                        .frame(width: 80, height: 80)
                                                    Text(Theme.nom)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                }
                                            }
                                            
                                        }
                                        }
                                    }
                                }
                            }
                            .padding()
                            // bas du 3e scroll
                            
                        }
                    } // fin du scroll view vertical
                    
                    // début bouton "tous les événements"
                    
                    /* NavigationLink(destination: TotalEventView()) {
                     HStack{
                     ZStack {
                     RoundedRectangle(cornerRadius: 15)
                     .foregroundColor(.black)
                     Text("Tous Les Evenements")
                     .foregroundColor(.yellow)
                     .font(.title)
                     
                     }
                     .frame(width : 280 ,height : 40)
                     }
                     }*/
                    // fin bouton "tous les événements"
                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
//        }
        
    }
    
    
}


/*struct ThemesView_Previews: PreviewProvider {
 static var previews: some View {
 ThemesView()
 }
 }
 */

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView()
    }
}
