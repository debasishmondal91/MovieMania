//
//  MovieDetailsView.swift
//  MovieMania
//
//  Created by Debasish Mondal on 10/07/22.
//

import Foundation
import SwiftUI

struct MovieDetailsView: View{
    @State var movie: Movie
    
    var body: some View{
        
        NavigationView{
        
            VStack{
                AsyncImage(url: URL(string: "\(movie.backgroudURL)")){ image in
                    image.resizable()
                }placeholder: {
                    ProgressView()
                }.frame(width: 200, height: 250)
                    .offset(y: -130)
                    .padding(.bottom,-130)
                Text(movie.originalTitle).font(.title).padding()
                Text(movie.releaseDate)
                Divider()
                Text(movie.overview).padding()
                
            }
            
        }
    }
}


struct MovieDetailsView_Preview: PreviewProvider{
    
    static  var previews: some View{
        MovieDetailsView(movie: Movie(id: 580489, adult: false, backdropPath: "/lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg", genreIDS: [878, 28, 12], originalLanguage: "en", originalTitle: "Venom: Let There Be Carnage", overview: "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.", popularity: 11473.714, posterPath: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", releaseDate: "2021-09-30", title: "Venom: Let There Be Carnage", video: false, voteAverage: 7.2, voteCount: 3947))
    }
    
}
