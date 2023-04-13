//
//  DetailProfilView.swift
//  AfpAppLoisirs
//
//  Created by Apprenent23 on 01/02/2023.
//
import SwiftUI


struct DetailProfilView: View {
    var membre : Membre
    var body: some View {
            NavigationStack {
                ZStack {
                    Color("fondClair")
                        .ignoresSafeArea()
                    VStack (){
                        Spacer()
                        HStack(){
                            Text(membre.prenom)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(membre.nom)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        let age = format().string(from : membre.dateNaissance.distance(to: Date()))!
                        Text(age)
                        
                        VStack(alignment: .center){
                            Image(membre.photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                            HStack{
                                Image(systemName: "")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                                Image(systemName: "")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.orange)
                                Image(systemName: "")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            Text("\(membre.nombreEvenementsOrganises) événements organisés")
                            Text("'\(membre.description)'")
                                .font(.system(size: 25))
                                .font(.subheadline)
                                .italic()
                                .multilineTextAlignment(.center)
                                .padding(.top, 20.0)
                                .padding(.horizontal, 50.0)
                            Spacer()
                            HStack{
                                NavigationLink {
                                    SignalerProfil(membre: membre)
                                } label: {
                                    VStack {
                                        ZStack {
                                            Image(systemName: "triangle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.orange)
                                            Image(systemName: "exclamationmark.triangle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                        }
                                        Text("Signaler")
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        Spacer()
                            .frame(height: 100)
                    }
                    //foreach
                    
                }
         }// VStack 1
    }// view body
} // View1





struct DetailProfilView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProfilView(membre: membres[0])
        
    }
}



