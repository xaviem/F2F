//
//  SignalerProfil.swift
//  AfpAppLoisirs
//
//  Created by Apprenent23 on 01/02/2023.
//


import SwiftUI

struct SignalerProfil: View {
    let membre: Membre
    //@EnvironmentObject var retour =
    @Environment(\.dismiss) var dismiss
    @State var text : String =  ""
    @State private var validationDanger = false
    var body: some View {
        
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            HStack {
                    VStack(){
                        Text("Signaler le Profil de:")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .shadow(radius: 10)
                        ZStack{
                            
                            VStack{
                                Image(membre.photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                Text("\(membre.prenom) \(membre.nom)")
                                .font(.system(size: 20, design: .rounded))
                                .fontWeight(.bold)
                                
                            }
                            
                        }
                        Divider()
                            .padding()
                        Text("Décrivez vos raisons")
                            .font(.title)
                        NavigationStack{
                            TextEditor(text: $text)
                                .frame(width: 350, height: 250)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray.opacity(0.2), lineWidth: 5))
                                .foregroundColor(.black)
                                .padding()
                        }
                        .frame(width: 350, height: 250)

                        
                      Spacer()
                            .frame(height : 70)
                        ZStack(alignment: .center){
                            Button{
                                validationDanger = true
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("boutonBleu"))
                                        .frame(width: 250, height: 45)
                                    Text("Valider")
                                    //.fontWeight(.bold)
                                        .foregroundColor(.black)
                                }}
                            .alert("Votre reclamation a bien été prise en charge", isPresented: $validationDanger) {
                                Button("OK"){dismiss()}
                            }
                        }
                        Spacer()
                         .frame(height: 50)
                    }
                    .padding()
                    Spacer()
            }
        }
        
    }
}



struct SignalerProfil_Previews: PreviewProvider {
    static var previews: some View {
        SignalerProfil(membre : membres[0])
    }
}
