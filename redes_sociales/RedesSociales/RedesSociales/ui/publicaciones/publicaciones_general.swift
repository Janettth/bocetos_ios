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
                VStack(alignment: HorizontalAlignment.center){
                    ForEach(controlador.publicacaiones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                            
                        }label: {
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)).foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                
                                VStack(alignment: HorizontalAlignment.leading){
                                    Text("\(publicacion.id)")
                                        .bold()
                                        .padding(10)
                                    
                                    Text("\(publicacion.title)")
                                        .bold()
                                    
                                    Text("\(publicacion.body)")
                                }.padding(10)
                                    .foregroundColor(.black)
                                
                            }.padding()
                            
                           
                            
                            /* .onTapGesture {
                                   controlador.mostrar_publicacion(publicacion.id)
                                    print("Usted ha selecionado: \(publicacion.id)")
                                }*/
                        } .simultaneousGesture(TapGesture().onEnded({
                            controlador.seleccionar_publicacion(publicacion)
                        }))
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
               
                
            }.background(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
            .frame(width: .infinity, height: .infinity)
        }
        
    }
        
}

#Preview{
    GeneralPublicaciones()
        .environment(controladorAplicacion())
}
