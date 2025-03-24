//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View{
        ScrollView{
            VStack(alignment: HorizontalAlignment.leading){
                ForEach(controlador.publicaciones){ publicacion in
                    
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)).foregroundColor(.gray)
                        
                        VStack(alignment: HorizontalAlignment.leading){
                            Text("\(publicacion.id)") .bold()
                            Text("\(publicacion.title)")
                                .bold()
                                .font(.system(size: 25))
                                
                            Text("\(publicacion.body)")
                        }.padding(10)
                            
                    }.padding()
                    
                    
                }
            }
            .onAppear{
                if(controlador.publicaciones.isEmpty){
                    Task{
                        await controlador.obtener_publicaciones()
                    }
                }
            }
            .padding(30)
        }
        
    }
        
}

#Preview{
    GeneralPublicaciones()
}
