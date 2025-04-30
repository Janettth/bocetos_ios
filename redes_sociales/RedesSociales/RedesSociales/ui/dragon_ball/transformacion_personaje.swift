//
//  transformacion_personaje.swift
//  RedesSociales
//
//  Created by alumno on 30/4/25.
//

import SwiftUI

let trasn_ejemplo = Transformacion(id: 1, name: "no sew", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKhJ9vY-WJviH34cgDfbG2Hn_cBf0t5BBmaWrmH--NzBO3pjGP6hjV7pb8s958ug9K7p6iR-3vz6nlw7c4i5ZdMw", ki: "5000")

struct TransformacionPersonaje: View {
    
    //@Environment(controladorAplicacion.self) var controlador
    var transformacion: Transformacion
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)).foregroundColor(.orange)
            
            VStack{

                
                HStack{
                    Text("\(transformacion.id)")
                    Text("\(transformacion.name)")
                }

                Text("KI: \(transformacion.ki)")
                AsyncImage(url: URL(string: transformacion.image)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .padding()
            }
        }.frame(width: 300, height: 500)

        
        
    }
}
    

#Preview {
    TransformacionPersonaje(transformacion: trasn_ejemplo)
}
