//
//  SignUpView.swift
//  F2F
//
//  Created by Apprenant 21 on 01/02/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var userId:String = ""
    @State private var userPassword:String = ""
    
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
                    
                    Text("Rejoins-nous!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Form {
                        
                        Section(header: Text("identifiant")) {
                            TextField("email ou téléphone", text: $userId)
                                .foregroundColor(.black)

                        }
                        Section(header: Text("mot de passe")){
                            TextField("8 signes minimum", text: $userPassword)
                                .foregroundColor(.black)

                        }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.white)
                    .frame(width: 250, height:200)
                    Spacer()
                        .frame(height : 100)
                    NavigationLink(destination : ThemesView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("boutonVert"))
                                .frame(width: 250, height: 50)
                            Text("Inscription")
                                .foregroundColor(.white)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isConnected = true
                    })
                    Spacer(minLength: 250)
                }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
