//
//  EditProfilView.swift
//  F2F
//
//  Created by Apprenant 21 on 01/02/2023.
//

import SwiftUI

struct EditProfilView: View {


    @Binding var showModal: Bool

    @Environment(\.presentationMode) var presentation
    @State private var loisir:String = ""
    @State private var membreEdit:Membre = membres[0]

    var body: some View {
        NavigationView {
            ZStack {
                Color("fondClair")
                    .ignoresSafeArea()
                VStack{
                    Text("Mon profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Image(membreEdit.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(80)
                        .clipped()
                    
                    Form{
                        Section(header: Text("prénom")) {
                            TextField("", text: $membreEdit.prenom)
                        }
                        Section(header: Text("nom")) {
                            TextField("", text: $membreEdit.nom)
                        }
                        Section(header: Text("je me présente")) {
                            
                            TextField("description", text:$membreEdit.description, axis:.vertical)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                        Section(header: Text("mes loisirs")) {
                            Picker("Mon loisir", selection: $loisir) {
                                //ForEach(themes){theme in
                                Text("theme")
                            }
                        }
                    }
                }
                .navigationBarItems(leading:
                                        Button(action: {
                    presentation.wrappedValue.dismiss()
                    self.showModal = false
                }, label: {
                    Text("Annuler")
                }), trailing: Button(action: {
                    membres[0].prenom = membreEdit.prenom
                    membres[0].nom = membreEdit.nom
                    membres[0].description = membreEdit.description
                    self.showModal = false
                }, label: {
                    Text("OK")
                })
                )
                
            }
        }

    }
}



struct EditProfilView_Previews: PreviewProvider {
    @State static var showModal = true

    static var previews: some View {
        EditProfilView(showModal: $showModal)
    }
}


