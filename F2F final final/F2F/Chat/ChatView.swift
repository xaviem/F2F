//
//  ChatView.swift
//  F2FChatView
//
//  Created by apprenant19 on 02/02/2023.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatsViewModel
    let chat: Chat
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDToScroll: UUID?
    var body: some View {
        ZStack {
            Color("fondClair")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                GeometryReader { reader in
                    ScrollView {
                        ScrollViewReader { ScrollViewReader in
                            getMessagesView(viewWidth: reader.size.width)
                                .padding(.horizontal)
                                .onChange(of: messageIDToScroll) { _ in
                                    if let messageID = messageIDToScroll {
                                        scrollTo(messageID: messageID, shoulAnimate: true, scrollReader: ScrollViewReader)
                                    }
                                }
                                .onAppear {
                                    if let messageID = chat.messages.last?.id {
                                        scrollTo(messageID: messageID, anchor: .bottom, shoulAnimate: false, scrollReader: ScrollViewReader)
                                    }
                                }
                        }
                    }
                }
                toolbarView()
            }
            .padding(.top,1)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: navBarLeadingBtn, trailing: navBarTrailingBtn)
            .onAppear{
                viewModel.markAsUnread( _newValue: false, chat: chat )
            }
        }
    }
    var navBarLeadingBtn: some View {
        NavigationLink(destination: DetailProfilView(membre: Membre(prenom: chat.person.name, nom: "", photo: chat.person.imgString, description: "blabla", login: "", motDePasse: "", dateNaissance: Date(), gouts: [], nombreEvenementsOrganises: 4))){
            HStack {
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(chat.person.name).bold()
            }
            .foregroundColor(.black)
        }
    }
    var navBarTrailingBtn: some View {
        HStack {
            Button(action: {} ) {
                Image(systemName: "video")
            }
            Button(action: {} ) {
                Image(systemName: "phone")
            }
        }
    }
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shoulAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shoulAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID,anchor: anchor)
            }
        }
    }
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 37
            HStack {
                TextField(" Message ...", text: $text)
                    .padding(.horizontal, 10)
                    .frame( height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height,height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .teal))
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    let colums = [ GridItem ( .flexible(minimum: 10 ))]
    func getMessagesView(viewWidth: CGFloat ) -> some View {
        LazyVGrid(columns: colums, spacing: 0) {
            ForEach ( chat.messages ) { message in
                let isReceived = message.type == .Received
                HStack {
                    ZStack{
                        Text(message.text)
                        
                            .padding(.horizontal)
                            .padding(.vertical,15)
                            .background(isReceived ? Color.indigo.opacity(0.4) : .mint.opacity(0.4))
                            .cornerRadius(13)
                    }
                    .frame(width: viewWidth * 0.9, alignment: isReceived ? .leading : .trailing)
                    .padding(.vertical)
                    //                    .background(Color.blue)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chat: Chat.sampleChat[0])
                .environmentObject(ChatsViewModel())
        }
        
        
    }
}
