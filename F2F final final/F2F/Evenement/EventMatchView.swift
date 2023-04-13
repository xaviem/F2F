//
//  EventMatchView.swift
//  F2F
//
//  Created by apprenant15 on 03/02/2023.
//

import SwiftUI

struct EventMatchView: View {
    @State var plusHour = ""
    @State var eventsChosen : Array<Evenement> = chooseEvents(time: 24)
    @Environment(\.presentationMode) var presentation

    enum DragState{
        case inactive
        case pressing
        case dragging(translation : CGSize)
        
        var translation : CGSize {
            switch self {
            case .inactive, .pressing :
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging : Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive :
                return false
            }
        }
        
        var isPressing : Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive :
                return false
            }
        }
    }
    
    @GestureState var dragState = DragState.inactive
    
    var body: some View {
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Voici les évenements pour vous dans les prochaines")
                        .font(.system(size : 15))
                    TextZone(text: $plusHour,indication: "24H", size: (100,60))
                        .onSubmit {
                            eventsChosen = chooseEvents(time: Double(plusHour) ?? 24)
                        }
                }
                ZStack{
                    ForEach(eventsChosen) { event in
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color(red: findNameCategory(event: event)=="Sports" ? 1 : 0.5,
                                                       green: findNameCategory(event: event)=="Cultures" ? 1 : 0.5,
                                                       blue: findNameCategory(event: event)=="Jeux" ? 1 : 0.5,
                                                       opacity : 1))
                            VStack{
                                Text(event.theme.nom)
                                    .padding()
                                Text(event.date, style: .date)
                                    .padding()
                                Text(event.date, style: .time)
                                    .padding()
                                Text(event.lieu)
                                    .padding()
                                Text("\(event.duree/60)H\(event.duree%60)")
                                    .padding()
                            }
                            .font(.title)
                            .foregroundColor(.black)
                            
                        }
                        .offset(x : t(event : event) ? self.dragState.translation.width : 0, y : t(event : event) ? self.dragState.translation.height/4 : 0)
                        .scaleEffect(t(event : event) && self.dragState.isDragging ? 0.95 : 1.0)
                        .rotationEffect(Angle(degrees: Double(t(event : event) ? self.dragState.translation.width / 10: 0)))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body:{ (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation : drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else{
                                        return
                                    }
                                    if drag.translation.width < -80.0 {
                                        eventsChosen.remove(at: eventsChosen.count-1)
                                    }
                                    if drag.translation.width > 80.0{
                                        eventsChosen.remove(at: eventsChosen.count-1)
                                        for i in 0...events.count-1{
                                            if events[i].id==event.id{
                                                events[i].membresId.append(membres[0].id)
                                            }
                                        }
                                    }
                                    if eventsChosen.count==0{
                                        presentation.wrappedValue.dismiss()
                                    }
                                }))
                        .padding()
                    }
                }
                HStack{
                    Text("✕")
                    Spacer()
                    Text("♥️")
                }
                .padding(.horizontal)
                .font(.largeTitle)
                .foregroundColor(.red)
            }
            .navigationTitle("Selection d'évenement")
        }
    }
    func t(event : Evenement)->Bool{
        return eventsChosen[eventsChosen.count-1]==event
    }
}

struct EventMatchView_Previews: PreviewProvider {
    static var previews: some View {
        EventMatchView()
    }
}
