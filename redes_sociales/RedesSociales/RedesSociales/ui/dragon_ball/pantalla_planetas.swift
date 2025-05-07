//
//  pantalla_planetas.swift
//  RedesSociales
//
//  Created by alumno on 2/5/25.
//

import SwiftUI

struct PantallaPlanetas: View {
    
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_planetas != nil){
            
            
           
                
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                .frame(width: .infinity, height: 100)
                                .foregroundColor(.white)
                                .opacity(0.5)
                            
                            Text("Planetas del universo Dragon Ball").bold()
                        }
                        
                        
                        ForEach(controlador.pagina_resultados_planetas!.items){ planeta in
                            NavigationLink{
                                Text("\(planeta.name)")
                                
                            }label: {
                                VStack{
                                    
                                    ZStack{
                                        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                            .frame(width:350)
                                            .foregroundColor(.orange)
                                        
                                        VStack{
                                            Text("\(planeta.name)")
                                            AsyncImage(url: URL(string: planeta.image)){ image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 200, height: 200)
                                            .padding()
                                        }.foregroundColor(.black)
                                            .padding()
                                    }
                                    
                                  
                                    
                                   
                                }
                                
                            }
                        }
                    }  .frame(width: .infinity, height: .infinity)
                        .padding()
                        .background(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
                        
                      
                    
                }
            }
          
        }
        else{
            Text("ho hay cosas")
                .onAppear{
                    Task{
                        await controlador.descargar_planetas()
                    }
                }
        }
    }
}
#Preview {
    PantallaPlanetas()
        .environment(controladorAplicacion())
}
