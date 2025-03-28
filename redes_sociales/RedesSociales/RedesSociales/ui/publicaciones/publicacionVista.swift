//
//  publicacionVista.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//


import SwiftUI

//let publicacaion_falsa = Publicacion(userId: 1, id: 1, title: "Titulooo", body: "hohojcdhbjhdfcjhedjdjhejd")

struct PublicacionVista: View {
    
    //let publicacion_a_mostrar: Publicacion
    @Environment(controladorAplicacion.self) var controlador
    
    //var publicacion_a_mostrar = controlador.publicacion_seleccionada
    var body: some View {
        Text("\(controlador.publicacion_seleccionada?.title ?? "valor por defecto")")
        Text("\(controlador.publicacion_seleccionada?.body ?? "valor por defecto")")
        
        
        NavigationLink{
           PublicacionVista()
        }label:{
            Text("ver perfil")
        }.simultaneousGesture(TapGesture().onEnded({
            controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
        }))
        
        ScrollView{
            VStack{
                ForEach(controlador.comentarios){comentario in
                    Text("Usuario \(comentario.name)")
                    Text("\(comentario.body)")
                }
            }
        }
    }
}


#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(controladorAplicacion())
    }
   
}
