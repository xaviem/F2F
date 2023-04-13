//
//  LoginOrSignUpView.swift
//  F2F
//
//  Created by Apprenant 21 on 01/02/2023.
//

import SwiftUI

struct LoginOrSignUpView: View {
    var body: some View {
        ZStack {
            Color("fondSombre")
                .frame(height : 1000)
            VStack {
                Image("F2F logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                Text("Bienvenue!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                NavigationLink(destination: LoginView())
                {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("boutonBleu"))
                            .frame(width:150,height:50)
                        Text("Je me connecte")
                            .foregroundColor(.black)
                    }
                }
                
                NavigationLink(destination: SignUpView())
                {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("boutonVert"))
                            .frame(width:150,height:50)
                        Text("Je m'inscris")
                            .foregroundColor(.black)
                            .frame(width:150,height:50)
                    }
                }
                .padding()
            }
        }
    }
}


struct LoginOrSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrSignUpView()
    }
}
