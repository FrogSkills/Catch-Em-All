//
//  DetailView.swift
//  Catch Em All
//
//  Created by Miguel on 1/1/26.
//

import SwiftUI

struct DetailView: View {
    let creature: Creature
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(creature.name.capitalized)
                .font(Font.custom("Avenr Next Condensed", size: 60))
                .bold()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .frame(width: 96, height: 96)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
                    .padding(.trailing)
                
                VStack {
                    HStack(alignment: .top) {
                        Text("Height:")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text("99")
                            .font(.largeTitle)
                            .bold()
                    }
                    HStack(alignment: .top) {
                        Text("Weight:")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.red)
                        
                        Text("99")
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DetailView(creature: Creature(name: "", url: "https://pokeapi.co/api/v2/pokemon/1/"))
}
