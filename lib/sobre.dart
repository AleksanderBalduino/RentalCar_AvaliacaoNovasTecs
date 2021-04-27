import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SobrePagina extends StatefulWidget {
  @override
  _SobrePaginaState createState() => _SobrePaginaState();
}

class _SobrePaginaState extends State<SobrePagina> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),

      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://instagram.frao2-1.fna.fbcdn.net/v/t51.2885-19/s150x150/123526889_209223300561612_2248374314926939185_n.jpg?tp=1&_nc_ht=instagram.frao2-1.fna.fbcdn.net&_nc_ohc=T7w7ra0nvowAX8Tza8e&edm=ABfd0MgAAAAA&ccb=7-4&oh=99bf9a02a2e0c2c16847eb3f138858d3&oe=60A223F5&_nc_sid=7bff83')
                  )
                ),
              )
            ],
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Aleksander Balduino', style: TextStyle(color: Colors.black, fontSize: 28),),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Código: 829.611', style: TextStyle(color: Colors.black, fontSize: 28),),
            ],
          ),

          SizedBox(height: 20),
          Container(
            height: 105,
            color: Colors.black,
            child: ListView.builder(
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text('O tema escolhido para a confecção deste trabalho foi de uma "Locadora de Automóveis"', style: TextStyle(color: Colors.white, fontSize: 24),),
                      )
                    ],
                  )
                );
              },

              itemCount: 1,
            ),
          ),

          SizedBox(height: 15),
          Container(
            height: 135,
            color: Colors.black,
            child: ListView.builder(
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Neste aplicativo é possível fazer a escolha de um automóvel para a sua locação, o local e data de retirada do automóvel', style: TextStyle(color: Colors.white, fontSize: 24),),
                      )
                    ],
                  )
                );
              },

              itemCount: 1,
            ),
          ),

          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(
                iconSize: 90,
                onPressed: () => launch('https://www.facebook.com/aleksander.balduino'),
                icon: Image.network('https://aleksanderbalduino.github.io/BaldsTurismo/imagens/facebook1.png')
              ),

              IconButton(
                iconSize: 90,
                onPressed: () => launch('https://www.instagram.com/aleksanderbalduino/'),
                icon: Image.network('https://aleksanderbalduino.github.io/BaldsTurismo/imagens/instagram1.png',)
              ),

              IconButton(
                iconSize: 90,
                onPressed: () => launch('https://www.linkedin.com/in/aleksander-balduino/'),
                icon: Image.network('https://aleksanderbalduino.github.io/BaldsTurismo/imagens/linkedin1.png',)
              ),

              IconButton(
                iconSize: 90,
                onPressed: () => launch('https://twitter.com/balduino_aleks'),
                icon: Image.network('https://aleksanderbalduino.github.io/BaldsTurismo/imagens/twitter1.png',)
              ),

            ],
          ),
        ],
      ),
    );
  }
}