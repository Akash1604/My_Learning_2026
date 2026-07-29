//
//  MovieView.swift
//  LearnSwiftUI
//
//  Created by Akash Revanna on 23/07/26.
//

import SwiftUI

struct Movies:Identifiable {
    var id = UUID()
    var name:String
    var favorite:Bool = false
    
    
}

struct MovieView: View {
    @State var movies:[Movies] = [ Movies(name: "DDLJ - A Love story"),Movies(name: "RHTDM - A Love story"),Movies(name: "GADAR - Ek Prem kahani"),
                                   Movies(name: "DDLJ - Ek sad kahani")]
    var body: some View {
        NavigationStack {
            VStack {
                List($movies) { $movie in
                    ///*@START_MENU_TOKEN@*/Text(movie.name)/*@END_MENU_TOKEN@*/
                    MovieRowView(movie: $movie)
                }
                
                Text("Favorite count: \(movies.filter { $0.favorite }.count)")
            }
            
            .navigationTitle("Movies")
        }
    }
}

struct MovieRowView: View {
    @Binding var movie:Movies
    var body: some View {
        VStack {
            Button {
                movie.favorite.toggle()
            } label: {
                HStack{
                    Text("\(movie.name)")
                    Spacer()
                    Image(systemName: movie.favorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                                    .padding(10) // Expands the clickable target area for human fingers
                                    .contentShape(Rectangle()) // Makes the padded transparent area clickable
                                    .onTapGesture {
                                        // Clicking here ONLY toggles favoritism; it stops navigation
                                        movie.favorite.toggle()
                                    }
                }
            }
        }
    }
}

struct MovieDetailView:View {
    @Binding var movie:Movies
    var body: some View {
        Text("Detailed movie name: \(movie.name)")
    }
}

#Preview {
    MovieView()
}
