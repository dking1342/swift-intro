//
//  swift4App.swift
//  swift4
//
//  Created by David King on 6/23/22.
//

import SwiftUI

@main
struct swift4App: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
