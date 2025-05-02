//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/3/25.
//

import SwiftUI
import PhotosUI //para usar galeria




/**
 
 que lapantalla tenga una variable @state var nombre: photopiker? = nil
 
 segundo state var foto: uiimage? nil // para guadar la foto
 para usar el elemento usar
 photospiker(selection: nombre){
    image(imagen: foto ?? UIImage(resource: .imagen escargada y guardada en assets))
 }
 
 */
struct PerfilBasicoVista: View {
    @Environment(controladorAplicacion.self) var controlador
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var imagen_a_mostrar: UIImage? = nil
    
    var body: some View {
        
        VStack{
            
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(.white .opacity(0.5))
                    .frame( width: .infinity, height: 30)
                
                Text("User: \(controlador.perfil_a_mostrar?.username ?? "valor por defecto")").bold()
                    
            }
            .frame(width: .infinity, height: 30)
            .padding()
            
            
            PhotosPicker(selection: $foto_seleccionada){
                Image(uiImage: imagen_a_mostrar ?? UIImage(resource: .avatarYa))
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
            }.onChange(of: foto_seleccionada){valor_anterior, valor_nuevo in
                Task{
                    if let foto_seleccionada, let datos = try? await
                        foto_seleccionada.loadTransferable(type: Data.self){
                        if let imagen = UIImage(data: datos){
                            imagen_a_mostrar = imagen
                        }
                    }
                }
            }.padding()
            
        
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(.white .opacity(0.5))
                    .frame( width: .infinity, height: 100)
                
                VStack{
                    Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "valor por defecto")")
                    Text("Email: \(controlador.perfil_a_mostrar?.email ?? "valor por defecto")")
                        .onDisappear(){
                            print("Adios mundo")
                        }
                }
            }.padding()
           
        }.frame(width: .infinity, height: 1000)
            .background(Color(red: 0.5, green: 0.25, blue: 0.4, opacity: 0.5))
        
       
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(controladorAplicacion())
}
