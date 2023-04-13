//
//  ContentView.swift
//  F2FChatView
//
//  Created by apprenant19 on 02/02/2023.
//

import SwiftUI

struct ParamettreChat: View {
    @StateObject var viewModel = ChatsViewModel()
    @State private var query = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color("fondClair")
                    .ignoresSafeArea()
                List {
                    ForEach (viewModel.getSortedFilterChats(query: query)) { chat in
                        ZStack {
                            NavigationLink(destination: {
                                ChatView(chat: chat)
                                    .environmentObject(viewModel)
                            })
                            {
                                ChatRow(chat: chat)
                            }
                        }
                        .swipeActions( edge: .leading , allowsFullSwipe: true ) {
                            Button(action: {
                                viewModel.markAsUnread(_newValue: !chat.hasUnreadMessage, chat: chat)
                            } ) {
                                
                                if chat.hasUnreadMessage {
                                    Label("Read", systemImage: "text.bubble")
                                }else {
                                    Label("Unread", systemImage: "circle.fill")
                                }
                            }
                            .tint(.teal)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .searchable(text: $query )
                .navigationTitle("Chats")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName:  "plus.message")
                })
            }
        }
    }
}

struct ParamettreChat_Previews: PreviewProvider {
    static var previews: some View {
        ParamettreChat()
    }
}
