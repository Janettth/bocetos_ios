//
//  personaje_completo.swift
//  RedesSociales
//
//  Created by alumno on 7/4/25.
//

import SwiftUI


/*let personaje_ejemplo = MonoChino(id: 2, name: "jeje", ki: "7888", maxKi: "445323", race: "nose", gender: "unaaa", description: "descripcion del personaje", image: "", affiliation: "", originPlanet: nil, transformations: nil)*/


struct PersonajeDescripcion: View {
    
    //var personaje_informacion: MonoChino
    
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
                        Text("\(controlador.persoanje?.name)").bold()
                    }
                    
                    Spacer()
                    
                    AsyncImage(url: URL(string: controlador.persoanje?.image ?? "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQd1kWKsODGmz1P44kiLTfpeIOkaemYITnaRVOZEn372xCyrpNoQQ_dMDAV4dWLpVTDFekNEtlkJaDnhlTzoQWdNg")){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 200)
                    .padding()
                    
                    Spacer()
                    
                    HStack(alignment: VerticalAlignment.center, spacing: 10){
                        VStack(spacing: 10){
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Ki: \(controlador.persoanje?.ki)").bold()
                            }
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Raza: \(controlador.persoanje?.race)").bold()
                            }
                            
                        }
                        VStack(spacing: 10){
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Max ki: \(controlador.persoanje?.maxKi)").bold()
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Género: \(controlador.persoanje?.gender)").bold()
                            }
                            
                            
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                        Text("\(controlador.persoanje?.description)")
                            .padding()
                    }
                    
                    
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                        
                        VStack{
                            
                            Text("PLaneta de origen")
                           
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Numero de planeta: \(controlador.persoanje?.originPlanet?.id)")
                            }.frame(height: 40)
                           
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Planeta: \(controlador.persoanje?.originPlanet?.name)")
                            }.frame(height: 40)
                          
                          
                            AsyncImage(url: URL(string: controlador.persoanje?.originPlanet?.image ?? "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQd1kWKsODGmz1P44kiLTfpeIOkaemYITnaRVOZEn372xCyrpNoQQ_dMDAV4dWLpVTDFekNEtlkJaDnhlTzoQWdNg")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 300, height: 300)
                            .padding()
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                
                                if(controlador.persoanje?.originPlanet?.isDestroyed == true){
                                    Text("Ya no existe este planeta")
                                    
                                }
                                else{
                                    Text("Planeta existente")
                                }
                                
                            }.frame(height: 40)
                            
                            
                            ZStack{
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                                Text("Planeta: \(controlador.persoanje?.originPlanet?.description)")
                                    .padding(30)
                               
                            }
                            
                           
                            
                           
                            
                        }.padding(20)
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
                        
                        VStack{
                            Text("Transfromaciones")
                            
                            if(controlador.persoanje?.transformations != nil){
                             
                                NavigationStack{
                                    
                                    LazyVStack{
                                        ForEach(controlador.persoanje!.transformations!){ transformacion in
                                            
                                            NavigationLink{
                                                TransformacionPersonaje(transformacion: transformacion)
                                            }label: {
                                                
                                                ZStack{
                                                    RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                                        .frame(width: 250, height: 70)
                                                        .foregroundColor(.orange)
                                                    
                                                    VStack{
                                                        Text("\(transformacion.name)")
                                                            .foregroundStyle(Color.black)
                                
                                                    }
                                                    
                                                }
                                              
                                            }.padding(5)
                                        }
                                    }
                                }
                                
                            }
                            
                        }.padding()
                       
                        
                      
                    }
                    
                }
                
            }
            .padding(20)
        }.frame(width: 350)
        
        
        
        
    
    }
}

#Preview {
    PersonajeDescripcion()
        .environment(controladorAplicacion())

}
