//
//  MemberStruct.swift
//  AfpAppLoisirs
//
//  Created by Apprenent23 on 02/02/2023.
//

import Foundation

var membres = [
    Membre (prenom: "Luke", nom: "Skywalker", photo: "gray", description: "Ma grande passion est de faire voler les objets avec ma force mentale, mais j'ai du mal à trouver des partenaires sur Toulouse", login: "",motDePasse: "", dateNaissance: Date().addingTimeInterval(-35*3600*24*365.25),gouts: [ThemesJeux[1],ThemesSport[0]], nombreEvenementsOrganises: 10),
    Membre(prenom: "Indiana", nom: "Jones", photo: "person.circle.fill", description: "J'aime les balades en jungle, mais je n'aime pas les serpents", login: "", motDePasse: "", dateNaissance: Date(), gouts: [], nombreEvenementsOrganises: 33),
    Membre(prenom: "Yanis", nom: "Bouchilloux", photo: "person.circle.fill", description: "j'aime rencontrer de nouvelles personnes qui partagent ma passion", login: "fejfe.fef@fze.fzp", motDePasse: "fkezfz,", dateNaissance: Date(), gouts: [], nombreEvenementsOrganises: 1),
    Membre(prenom: "Sigourney", nom: "Weaver", photo: "person.circle.fill", description: "J'ai une grande passion pour les animaux exotiques, tant qu'ils ne me bavent pas dessus", login: "", motDePasse: "", dateNaissance: Date(), gouts: [], nombreEvenementsOrganises: 13),
    Membre(prenom: "Emma", nom: "Watson", photo: "person.circle.fill", description: "J'adore les tours de magie, mais je cherche un endroit pour apprendre", login: "", motDePasse: "", dateNaissance: Date(), gouts: [], nombreEvenementsOrganises: 763),
]
var events = sort(events : [
    Evenement(date: Date().addingTimeInterval(164), duree: 770, theme: Theme(nom : "Jeux Video",image : "JeuxVideo"), description: "cherche 4 joueurs pour le prochain tournoi Clash sur League Of Legend.", lieu: "boulevard de super héros", prix: 0,leader: membres[2], membresId: [membres[2].id]),
    Evenement(date: Date().addingTimeInterval(1449990), duree: 102, theme: Theme(nom : "Jeux Video",image : "JeuxVideo"), description: "une petite partie de sabre laser?", lieu: "planète Tatooine, c'est à 2 pas", prix: 0,leader: membres[0], membresId: [membres[0].id]),
    Evenement(date: Date().addingTimeInterval(94499), duree: 456, theme: Theme(nom : "Jeux Video",image : "JeuxVideo"), description: "cherche 1 joueur pour m'apprendre à jouer à Street Fighter 5.", lieu: "place des anciens combattants", prix: 5,leader: membres[4], membresId: [membres[2].id]),
    Evenement(date: Date().addingTimeInterval(4999994), duree: 591, theme: Theme(nom : "Jeux Video",image : "JeuxVideo"), description: "cherche 20 joueurs pour raid WOW HL à l'ICC.", lieu: "la cave Poésie", prix: 10,leader: membres[1], membresId: [membres[1].id]),
    Evenement(date: Date().addingTimeInterval(5744999), duree: 149, theme: Theme(nom : "FootBall",image : "BallonFoot"), description: "veut faire un foot", lieu: "place du Capitole", prix: 0,leader: membres[3], membresId: [membres[3].id]),
    Evenement(date: Date().addingTimeInterval(54499999), duree: 707, theme: Theme(nom:"Théatre", image: "Theatre"), description: "veut aller voir la piece \"développeur malgré moi\" ", lieu: "théâtre Garonne", prix: 0,leader: membres[4], membresId: [membres[4].id])
])
var categories = [
    Categorie(nom : "Jeux",theme: [Theme(nom : "Jeux de plateau", image :""),Theme(nom : "Jeux Video",image: "") ,Theme(nom :"Jeux de Cartes",image : "") ,Theme(nom : "Autres",image : "")],image: "person.fill"),
    Categorie(nom : "Sports",theme: [Theme(nom : "FootBall", image :""),Theme(nom : "BasketBall",image: "") ,Theme(nom :"Ping-Pong",image : ""), Theme(nom: "Tennis", image: "tennis.racket") ,Theme(nom : "Autres",image : "")],image: "person.fill"),
    Categorie(nom : "Cultures",theme: [Theme(nom : "Musée", image :""),Theme(nom : "Cinéma",image: "") ,Theme(nom :"Théatre",image : "") ,Theme(nom : "Autres",image : "")],image: "person.fill"),
    Categorie(nom : "Autres",theme: [],image: "person.fill")
]
var ThemesSport = [
    Theme(nom:"FootBall", image: "BallonFoot"),
    Theme(nom:"BasketBall", image: "BallonBasket"),
    Theme(nom:"Ping-Pong", image: "Pingpong"),
    Theme(nom:"HandBall", image: "BallonHand")]
var ThemesJeux = [
    Theme(nom:"Echecs", image: "Echecs"),
    Theme(nom:"Jeux Video", image: "JeuxVideo"),
    Theme(nom:"Monopoly", image: "Monopoly"),
    Theme(nom:"Jeux de Cartes", image: "Carte")]
var ThemesCulture = [
    Theme(nom:"Cinéma", image: "Cinema"),
    Theme(nom:"Musée", image: "Musee"),
    Theme(nom:"Théatre", image: "Theatre"),
    Theme(nom:"Concert", image: "Concert")]
extension Chat {
    static let sampleChat = [
        
        Chat(person: Person ( imgString: "imag1", name: "Jules", activiter: "Café MeaoW"), messages: [
            Message("Meaow", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 3))),
             Message("Meaow Meaow", type: .Received),],
           
             hasUnreadMessage:true),
        
        
        Chat(person: Person ( imgString: "imag4", name: "Laura", activiter: "Piano"), messages: [
            Message("Hey! tu donnes des cours ?", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 10))),
             Message("Oui ! seulement le samedi à 9h", type: .Received),],
           
             hasUnreadMessage:true),
            
        Chat(person: Person ( imgString: "imag3", name: "Valentine", activiter: "Jeux Video"), messages: [
            Message("Hey! on joue 👀 ?", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 9))),
             Message("👀 🌳⛏️?", type: .Received),],
           
             hasUnreadMessage:true),
        
        Chat(person: Person ( imgString: "imag5", name: "Lola", activiter: "Cours de guitare"), messages: [
            Message("vous proposez des cours ?", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 3))),
             Message("non, pas en ce moment.", type: .Received),],
           
             hasUnreadMessage:true),
        
        
        Chat(person: Person ( imgString: "imag6", name: "Perle", activiter: "Musée"), messages: [
            Message("Hey! un tour au musée dimanche?", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 10))),
             Message("Oui !✨🌃", type: .Received),],
           
             hasUnreadMessage:true),
            
        Chat(person: Person ( imgString: "imag7", name: "Valentin", activiter: "Art Appliquer"), messages: [
            Message("Hey! tu donnes des cours ?", type: .Sent, date: (Date(timeIntervalSinceNow: -86400 * 9))),
             Message("Oui ! seulement le mercredi apre- midi", type: .Received),],
           
             hasUnreadMessage:true),
        
        
        ]
}
var isConnected = false
