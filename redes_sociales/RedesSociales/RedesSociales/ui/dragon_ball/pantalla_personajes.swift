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
            
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.pagina_resultados!.items){ personaje in
                            NavigationLink{
                                PersonajeDescripcion(personaje_informacion: personaje)
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                        .frame(width: 250)
                                        .foregroundColor(.orange)
                                        
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
                                            
                                        }
                                    
                                        
                                       
                                        
                                    }
                                    .padding()
                                    .foregroundColor(.black)
                                }
                            }
                            
                            
                        }
                    }
                    .background(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
                    .frame(width: .infinity, height: .infinity)
                        
                }
            }
            
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(controladorAplicacion())
}
