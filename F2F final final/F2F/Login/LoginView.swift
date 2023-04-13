//
//  LoginView.swift
//  F2F
//
//  Created by Apprenant 21 on 01/02/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var autorisation: Bool = false
    let loginDB: String = "eeeee" // cas de test
    let mdpDB: String   = "1234"
    @State var errorMessage = ""
    @State private var userTry: String = "" // saisie
    @State private var passwordTry: String = "" // saisie

    var body: some View {
            ZStack {
                Color("fondSombre")
                    .frame(height : 1000)
                VStack{
                    Spacer()
                    Image("F2F logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text("Identifie-toi!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    NavigationLink(destination: ThemesView(), isActive: $autorisation) {} // "isActive" deprecated in iOS 16?

                    // utiliser .disabled(score <= target)
                    
                    Form {
                        
                        Section(header: Text("identifiant")) {
                            TextField("email ou téléphone", text: $userTry)
                                .autocapitalization(.none)
                                .foregroundColor(.black)

                        }
                        Section(header: Text("mot de passe")){
                            SecureField("8 signes minimum", text: $passwordTry)
                                .autocapitalization(.none)
                                .foregroundColor(.black)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.white)
                    .frame(width: 250, height:200)
                    
                    Spacer()
                        .frame(height : 100)
                    Button(action: connectAction,label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("boutonBleu"))
                                .frame(width: 250, height: 50)
                            Text("Connexion")
                                .foregroundColor(.black)
                        }
                    } )
                    Text(errorMessage) // un message d'erreur en rouge (feedback)
                        .padding()
                        .foregroundColor(.red)
                    Spacer()
                }
            }
            

    }
    func connectAction() { // méthode de ma structure FormView, appelé qd je clique sur Connexion

        if userTry.isEmpty { // si ma saisie est vide
            errorMessage = "Vous n'avez pas entré votre Login"

        }else if userTry != loginDB  { // un peu léger... il faudrait parcourir la bdd
            errorMessage = "Pseudo inconnu"

        }else if passwordTry.isEmpty { // pwd vide
            errorMessage = "saisir le mdp"

        }else if passwordTry != mdpDB  { // pwd ne correspond pas (...un peu léger)
            errorMessage = "mdp invalide!"

        }else if userTry == loginDB && passwordTry == mdpDB { // si c'est bon
            autorisation = true
            isConnected = true
            //  errorMessage = "connecté"
        }else {
            errorMessage = "Error 404.." // le cas imprévu
        }


    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
