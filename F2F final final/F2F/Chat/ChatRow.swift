//
//  ChatRow.swift
//  F2FChatView
//
//  Created by apprenant19 on 02/02/2023.
//

import SwiftUI

struct ChatRow: View {
    let chat: Chat
    var body: some View {
        HStack (spacing: 20)  {
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 60,height: 60)
                .clipShape(Circle())
            ZStack {
                VStack(alignment: .leading,spacing: 5){
                    HStack{
                        Text(chat.person.activiter)
                            .bold()
                        Spacer()
                        
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("par \(chat.person.name)")
                            .foregroundColor(.gray)
                         
                        Circle()
                            .foregroundColor(chat.hasUnreadMessage ? .mint : .clear)
                            .frame(width: 18, height: 18)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                }
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[1] )
           
    }
}
