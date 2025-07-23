//
//  ProductoModelo.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import Foundation

// Respuesta entera
struct ProductoRespuesta: Decodable {
    let mensaje: String
    let resultado: Resultado
}

// Key 'resultado' en respuesta entera
struct Resultado: Decodable {
    let productos: [Producto]
}

struct Producto: Decodable, Identifiable {
    let id: String
    let nombre: String
    let codigoCategoria: String
    let precioRegular: Int
    let urlImagenes: [URL]
}
