//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    //@StateObject var controlador = ControladorPublicaciones()
    
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View{
        
        NavigationStack{
            ScrollView{
                VStack(alignment: HorizontalAlignment.leading){
                    ForEach(controlador.publicacaiones){ publicacion in
                        NavigationLink{
                            Text("Hola mundo")
                            
                        }label: {
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)).foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.15))
                                
                                VStack(alignment: HorizontalAlignment.leading){
                                    Text("\(publicacion.id)")
                                        .bold()
                                        .padding(10)
                                    
                                    
                                    Text("\(publicacion.title)")
                                        .bold()
                                    
                                    Text("\(publicacion.body)")
                                }.padding(10)
                                
                            }.padding()
                                .onTapGesture {
                                    /*controlador.mostrar_publicacion(publicacion.id)*/
                                    print("Usted ha selecionado: \(publicacion.id)")
                                }
                        }
                    }
                }
                /*.onAppear{
                 if(controlador.publicaciones.isEmpty){
                 Task{
                 await controlador.obtener_publicaciones()
                 }
                 }
                 }*/
                .padding(30)
            }
        }
        
    }
        
}

#Preview{
    GeneralPublicaciones()
        .environment(controladorAplicacion())
}
