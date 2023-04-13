//
//  DataBaseF2F.swift
//  F2F
//
//  Created by apprenant15 on 31/01/2023.
//

import Foundation

// objets à modéliser:

struct Categorie : Identifiable { // Sport, Culture
    var id = UUID()
    let nom:String // ex: "Sport"
    let theme:Array<Theme> // liste de Sous-thèmes
    var image:String // une image illustrant le thème
}
struct Theme : Identifiable, Equatable{// Sous Thèmes: football, basketball
    let id = UUID()
    let nom:String // ex: "football"
    let image:String // image illustrant le football
    static func ==(lhs: Theme, rhs: Theme) -> Bool {
        return lhs.nom == rhs.nom
    }
}

struct Membre : Identifiable{ // une personne inscrite
    var id = UUID()
    var prenom:String
    var nom:String
    var photo:String
    var description:String
    var login:String // son téléphone ou son email
    var motDePasse:String
    var dateNaissance:Date
    var gouts: Array <Theme> // ses préférences de loisirs, sous forme de collection de Sous-Thème(array)
    var nombreEvenementsOrganises:Int // le nb d'évenement que ce membre à déjà organisés dans le passé
}

struct Evenement : Identifiable, Equatable, Comparable{
    var id : UUID? = UUID()
    var date : Date
    var duree : Int//nbr minute
    var theme: Theme // ex: football
    var description: String // petit résumé de l'événement
    var lieu: String // la struct Adresse reste à définir (plus tard)
    var prix: Double // le coût de la participation
    var leader: Membre // la personne qui propose
    var membresId : Array<UUID>
    static func ==(lhs: Evenement, rhs: Evenement) -> Bool {
        return lhs.id == rhs.id
    }
    static func <(lhs: Evenement, rhs: Evenement) -> Bool {
        return lhs.date < rhs.date
    }
}

struct Signalement{ // signalement d'un comportement abusif par un membre
    let sender:Membre
    let target:Membre
    var motif:String // quel est le problème
}

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}
struct Person: Identifiable {
    let id = UUID()
    let imgString: String
    let name : String
    let activiter : String
}
struct Message: Identifiable {
    
    enum MessageType {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
   
    
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

func sort(events : Array<Evenement>) -> Array<Evenement>{
    return events.sorted()
}


func format() ->DateComponentsFormatter{
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.year]
    return formatter
}


extension Date {

    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    func descriptiveString (dateStyle: DateFormatter.Style = .short) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        if daysBetween == 0 {
            return "Today"
        }
        else if daysBetween == 1 {
            return "Yesterday"
        }
        else if daysBetween < 5 {
            let weekdayIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdayIndex]
        }
        return formatter.string(from: self)
    }
        
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        if let daysBetween = calendar.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
    }
}

// Function pour le matchView
func chooseEvents(time : Double) -> Array<Evenement> {
    var evenements : Array<Evenement> = []
    for event in events{
        if event.date < Date().addingTimeInterval(time*3600) && membres[0].gouts.contains(event.theme) && !(event.membresId.contains(membres[0].id)){
            print(!(event.membresId.contains(membres[0].id)))
            evenements.append(event)
        }
    }
    return evenements
}

func findNameCategory(event : Evenement) -> String{
    for categorie in categories{
        if categorie.theme.contains(event.theme){
            return categorie.nom
        }
    }
    return ""
}
