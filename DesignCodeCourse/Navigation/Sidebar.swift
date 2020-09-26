//
//  Sidebar.swift
//  DesignCodeCourse
//
//  Created by Stanley Traub on 9/22/20.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            content
                .navigationTitle("Learn")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "person.crop.circle")
                        }
                    }
                }
            #else
            content
                .frame(minWidth: 200, idealWidth: 250, maxWith: 200)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            #endif
            CoursesView()
        }
    }
    var content: some View {
        List {
            NavigationLink(destination: CoursesView()) {
                Label("Courses", systemImage: "book.closed")
            }
            Label("Tutorials", systemImage: "list.bullet.rectangle")
            Label("Livestreams", systemImage: "tv")
            Label("Certificates", systemImage: "mail.stack")
            Label("Search", systemImage: "magnifyingglass")

        }
        .listStyle(SidebarListStyle())
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
            .previewDevice("iPhone 11 Pro")
    }
}
