//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 31/3/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            
            GeneralPublicaciones()  //asi mandas llamara a otra pantalla
                .tabItem {
                    Label ("Publicaciones", systemImage:"doc.plaintext")
                       
                } .badge(controlador.publicacaiones.count)

            Text("Hola dos")
                .tabItem {
                    /*Label{
                        VStack{
                            Text("")
                        }
                    }*/
                    /*
                    Label{
                        Text("Hola uno")
                        Text("Hola dos")
                    }icon:{
                    Circle()
                        .frame(width: 44, height: 44, alignment: .center)
                        .overlay(Text("holaaaaa"))
                }*/
                    Label ("otro texto", systemImage: "triangle")
                }
            
            Text("Hola desde pantalla 3")
                .tabItem {
                    Label ("etiqueta", systemImage: "square")
                }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(controladorAplicacion())
}
