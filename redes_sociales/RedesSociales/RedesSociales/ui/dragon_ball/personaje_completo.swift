//
//  personaje_completo.swift
//  RedesSociales
//
//  Created by alumno on 7/4/25.
//

import SwiftUI


let personaje_ejemplo = MonoChino(id: 2, name: "jeje", ki: "7888", maxKi: "445323", race: "nose", gender: "unaaa", description: "descripcion del personaje", image: "", affiliation: "", originPlanet: nil, transformations: nil)


struct PersonajeDescripcion: View {
    
    var personaje_informacion: MonoChino
    
    @Environment(controladorAplicacion.self) var controlador
    
    var body: some View {
        

        ZStack{
            
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                
                .foregroundColor(.orange)
                
            VStack{
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .frame(width: 250, height: 50)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                        Text("\(personaje_informacion.name)").bold()
                    }
                    
                   Spacer()
                    
                    AsyncImage(url: URL(string: personaje_informacion.image)){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 200)
                    .padding()
                   
                    Spacer()
                    
                    HStack(spacing: 10){
                        VStack(spacing: 10){
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                                Text("Ki: \(personaje_informacion.ki)").bold()
                            }
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                                Text("Raza: \(personaje_informacion.race)").bold()
                            }

                        }
                        VStack(spacing: 10){
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                                Text("Max ki: \(personaje_informacion.maxKi)").bold()
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
                                Text("Género: \(personaje_informacion.gender)").bold()
                            }
                            
                           
                        }
                    }

                    Spacer()
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                        Text("\(personaje_informacion.description)")
                            .padding()
                    }
                   
                }
    
            }
            .padding(20)
        }.frame(width: 350)
          
       
        
       
        
    }
}

#Preview {
    PersonajeDescripcion(personaje_informacion: personaje_ejemplo)
}
