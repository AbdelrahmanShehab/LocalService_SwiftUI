//
//  ContentView.swift
//  LocalService
//
//  Created by Abdelrahman Shehab on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel(service: Localservice())
    }
    
    var body: some View {
        
        List(userListViewModel.userList, id: \.id) { user in
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }//: VSTACK
        }//: LIST
        .task {
            await userListViewModel.downloadUsers()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
