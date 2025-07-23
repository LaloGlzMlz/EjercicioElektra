//
//  ListaProductos.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct ListaProductos: View {
    let productos: [Producto]
    
    var body: some View {
        ScrollView {
            ForEach(productos) { producto in
                TarjetaProductoVista(producto: producto)
                    .padding()
            }
        }
    }
}

#Preview {
    ListaProductos(productos: [Producto(id: "1", nombre: "NintendoSwitch", codigoCategoria: "N", precioRegular: 500, urlImagenes: [URL(string: "https://assets.nintendo.eu/image/private/f_auto,c_limit,w_1920,q_auto:low/odxx8ysoourxkmjhb00e")!, URL(string: "https://i.ytimg.com/vi/CH8MWz8fCOk/maxresdefault.jpg")!]), Producto(id: "1", nombre: "NintendoSwitch", codigoCategoria: "N", precioRegular: 500, urlImagenes: [URL(string: "https://assets.nintendo.eu/image/private/f_auto,c_limit,w_1920,q_auto:low/odxx8ysoourxkmjhb00e")!, URL(string: "https://i.ytimg.com/vi/CH8MWz8fCOk/maxresdefault.jpg")!])])
}
