//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View {
        
        if(controlador.pagina_resultados != nil){
            ScrollView{
                LazyVStack{
                    ForEach(controlador.pagina_resultados!.items){ personaje in
                        ZStack{
                            
                            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                .frame(width: 250)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                
                            VStack{
                                Text("\(personaje.name)")
                                    .bold()
                                HStack{
                                    
                                    AsyncImage(url: URL(string: personaje.image)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 80, height: 200)
                                    .padding()
                                    
                                    Text("holaaa")
                                        .padding()
                                }
                            
                                
                               
                                
                            }
                            .padding()
                        }
                       
                            
                      
                    }
                } .frame(width: .infinity)
                    .background(Color.blue)
            }
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(controladorAplicacion())
}
