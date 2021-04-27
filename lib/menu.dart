import 'dart:ui';
import 'package:flutter/material.dart';
import 'main.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Recebendo os dados da outra página
    Mensagem msg = ModalRoute.of(context).settings.arguments;
    if (msg == null) {
      msg = Mensagem('', '');
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/ti/vetor-gratis/t2/140572-lowpoly-gray-gradient-vector-grátis-vetor.png'),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-256.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      msg.login,
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),

                SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      msg.login + '@gmail.com',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),

              ],
            ),

          ),

          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.vpn_key_sharp,
              color: Colors.black,
            ),
            title: Text(
              'Alugar Carro',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Carro');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: Text(
              'Informações do pedido',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Informações');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            title: Text(
              'Notificações',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              //
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                    child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.computer,
              color: Colors.black,
            ),
            title: Text(
              'Conheça mais o Dev',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Sobre');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.description,
              color: Colors.black,
            ),
            title: Text(
              'Normas da empresa',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              //
            },
          ),

          //Divider(),

          SizedBox(height: 60),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Configurações',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              //
            },
          ),

          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),

            title: Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ),

            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Encerrar a sessão', style: Theme.of(context).textTheme.headline1,),
                    content: Text('Você tem certeza que deseja sair de sua conta?', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    elevation: 24.0,
                    backgroundColor: Colors.red,

                    actions: [

                       FlatButton(
                        textColor: Colors.black,
                        onPressed: () {Navigator.of(context).pop();},
                        child: Text('Cancelar', style: Theme.of(context).textTheme.headline6,),
                      ),

                      FlatButton(
                        textColor: Colors.black,
                        onPressed: () {Navigator.pushNamed(context, 'Login');},
                        child: Text('Sair', style: Theme.of(context).textTheme.headline6,),
                      ),

                    ],
                  );
                }
              );
            },
          ),

          SizedBox(height: 80),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                        // Respond to button press
                    },
                    icon: Icon(Icons.phone, color: Colors.black,),
                    label: Text("Fale conosco", style: TextStyle(fontSize: 18, color: Colors.black),),
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Copyright © 2021 Rental Car', style: TextStyle(fontSize: 16),),
              Text('Inc. All rights reserved', style: TextStyle(fontSize: 16),),
            ],
          ),

        ],
      ),
    );
  }
}
