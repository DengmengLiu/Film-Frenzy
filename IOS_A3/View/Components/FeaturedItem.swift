//
//  FeaturedItem.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct FeaturedItem: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280/" + (movie.posterPath))){ image in image.resizable()
                    .aspectRatio(contentMode: .fit).frame(width: .infinity)
            }placeholder: {
                ProgressView()
            }
            Text(movie.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Text(movie.releaseDate)
                .font(.footnote)
                .fontWeight(.semibold)
            Text(movie.overview)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/, 20.0)
        .listStyle(.insetGrouped)
        .navigationTitle("Account")
        
        .background(.ultraThinMaterial)
        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        .frame(height: 600.0)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.horizontal, 20)
    
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var dummyMovie: Movie = Movie(adult: false,
                                             backdropPath: "/path_to_backdrop",
                                             genreIds: [1, 2, 3],
                                             id: 123,
                                             originalLanguage: "en",
                                             originalTitle: "Original Title",
                                             overview: "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
                                             popularity: 123.45,
                                             posterPath: "/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
                                             releaseDate: "2023-05-17",
                                             title: "Fast X",
                                             video: false,
                                             voteAverage: 7.8,
                                             voteCount: 123)
    static var previews: some View {
        FeaturedItem(movie: dummyMovie)
    }
}
