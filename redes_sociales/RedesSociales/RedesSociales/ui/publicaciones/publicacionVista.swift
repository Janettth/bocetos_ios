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
        
        VStack(alignment: HorizontalAlignment.center){
            
            Text("\(controlador.publicacion_seleccionada?.title ?? "valor por defecto")")
                .font(.system(size: 22).bold())
            
            
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
                
                Text("\(controlador.publicacion_seleccionada?.body ?? "valor por defecto")")
            }.padding(20)
            
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
                        
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)).foregroundColor(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
                            
                            Text("Usuario \(comentario.name)") .bold()
                            Text("\(comentario.body)")
                        }
                       
                    }
                }
            }
        }.padding(30)
        
            
       
        
        
       
    }
}


#Preview {
    NavigationStack{
        PublicacionVista()
            .environment(controladorAplicacion())
    }
   
}

