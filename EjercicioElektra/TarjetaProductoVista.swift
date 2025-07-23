//
//  TarjetaProductoVista.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct TarjetaProductoVista: View {
    let producto: Producto
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(producto.nombre)
                        .font(.title)
                        .bold()
                    
                    Text("Categoría: \(producto.codigoCategoria)")
                        .padding(.top, 3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text("$ \(producto.precioRegular)")
                    .bold()
                    .font(.title2)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(producto.urlImagenes, id: \.self) { imagen in
                    AsyncImage(url: imagen) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                )
                .shadow(radius: 10)
        )
    }
}


#Preview {
    TarjetaProductoVista(producto: Producto(id: "1", nombre: "NintendoSwitch", codigoCategoria: "N", precioRegular: 500, urlImagenes: [URL(string: "https://assets.nintendo.eu/image/private/f_auto,c_limit,w_1920,q_auto:low/odxx8ysoourxkmjhb00e")!, URL(string: "https://i.ytimg.com/vi/CH8MWz8fCOk/maxresdefault.jpg")!]))
}
