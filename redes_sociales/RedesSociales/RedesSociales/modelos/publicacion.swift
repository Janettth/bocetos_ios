//
//  publicacion.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

/*
 
 encodable - convierte struct en json
 decodable - convierte un json en struct
 codable - convierte de json a struct y viseversa
 
 */
struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}
