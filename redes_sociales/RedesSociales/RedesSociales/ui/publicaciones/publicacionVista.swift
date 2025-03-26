//
//  publicacionVista.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//


import SwiftUI

let publicacaion_falsa = Publicacion(userId: 1, id: 1, title: "Titulooo", body: "hohojcdhbjhdfcjhedjdjhejd")

struct PublicacionVista: View {
    
    let publicacion_a_mostrar: Publicacion
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View {
        Text("\(publicacion_a_mostrar.title)")
        Text("\(publicacion_a_mostrar.body)")
        
        ScrollView{}
    }
}


#Preview {
    PublicacionVista(publicacion_a_mostrar: publicacaion_falsa)
}
