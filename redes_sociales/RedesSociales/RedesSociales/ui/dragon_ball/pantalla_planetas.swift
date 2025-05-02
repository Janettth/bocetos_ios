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
                        Text("Planetas")
                        
                        ForEach(controlador.pagina_resultados_planetas!.items){ planeta in
                            NavigationLink{
                                Text("\(planeta.name)")
                                
                            }label: {
                                VStack{
                                    
                                    
                                    Text("\(planeta.name)")
                                    AsyncImage(url: URL(string: planeta.image)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 200, height: 200)
                                    .padding()
                                }
                                
                            }
                        }
                    }  .frame(width: .infinity, height: .infinity)
                    
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
