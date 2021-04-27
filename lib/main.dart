import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rental_car/sobre.dart';
import 'menu.dart';
import 'info.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Rental Car',

    theme: ThemeData(
      primaryColor: Colors.black,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 28, 
          fontWeight: FontWeight.bold, 
          color: Colors.black
        ),
        headline2: TextStyle(
          fontSize: 20,
          color: Colors.white54,
        ),
        headline3: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Colors.black
        ),
        headline4: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
        headline5: TextStyle(
          fontSize: 20,
          color: Colors.black
        ),
        headline6: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      )
    ),

    //Rotas de Navegação
    initialRoute: 'Login',
    routes: {
      'Login': (context) => Login(),
      'MenuBar': (context) => MenuBar(),
      'Menu': (context) => Menu(),
      'Sobre': (context) => Sobre(),
      'Carro': (context) => Carro(),
      'Pedido': (context) => Pedido(),
      'Informações': (context) => Info(),
    },
  ));
}

//Troca de dados entre as telas
class Mensagem {
  final String login;
  final String senha;
  Mensagem(this.login, this.senha);
}

// Primeira Tela - Login

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _txtLogin = TextEditingController();
  var _txtSenha = TextEditingController();
  bool _showPassword = false;

  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF757575),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/imagens/Logo.jpg',
                    width: 125,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 65)),
                  Text('Rental Car',
                      style: Theme.of(context).textTheme.headline1),
                ],
              ),
              SizedBox(height: 10),

              Divider(
                color: Colors.black,
                thickness: 5,
              ),
              
              SizedBox(height: 30),
              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtLogin,
                decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  hintText: 'Digite seu nome de usuário',
                  hintStyle: Theme.of(context).textTheme.headline3,
                  helperText: '',
                  helperStyle: Theme.of(context).textTheme.headline3,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),

              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtSenha,
                maxLength: 15,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  hintText: 'Digite sua senha',
                  hintStyle: Theme.of(context).textTheme.headline3,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility, color: Colors.black),
                    onTap: (){
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: _showPassword == false ? true : false,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      //
                    }, 
                    child: Text("Esqueceu a senha?", style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ],
              ),
              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    buttonPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        onChanged: (val){
                          setSelectedRadio(val);
                        }
                      )
                    ],
                  ),

                  Text('Lembrar Login', style: Theme.of(context).textTheme.headline5),
                ],
              ),
              SizedBox(height: 45),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botaoEntrar('Entrar no App'),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 400, height: 50),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.network('https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Google-256.png', scale: 9.5,),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Text('Entrar com a conta Google', style: TextStyle(fontSize: 20, color: Colors.black),),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), alignment: Alignment.centerLeft),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 400, height: 50),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Icon(Icons.facebook, size: 34),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 48),
                        child: Text('Entrar com o Facebook', style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[700]), alignment: Alignment.centerLeft),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 400, height: 50),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Image.network('https://cdn3.iconfinder.com/data/icons/capsocial-round/500/twitter-256.png', scale: 6,),
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Text('Entrar com o Twitter', style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 85, 172, 238)), alignment: Alignment.centerLeft),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 400, height: 50),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        //
                      },
                      icon: Icon(Icons.person_add, size: 24),
                      label: Text('Cadastrar Usuário', style: TextStyle(fontSize: 20, color: Colors.white)),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),
                    ),
                  ),
                ],
              )

            ],
          ),
      ),
    );
  }

  Widget botaoEntrar(rotulo) {
    return Container(
      width: 400,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
        child: Text(rotulo, style: Theme.of(context).textTheme.headline4,),
        onPressed: () {
          // Troca dos dados nas telas
          var msg = Mensagem(
            _txtLogin.text,
            _txtSenha.text,
          );

          Navigator.pushNamed(context, 'Menu', arguments: msg);
        },
      ),
    );
  }
}

//Segunda Tela - Menu

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(title: Text(''), backgroundColor: Colors.black,),
      backgroundColor: Color(0xFF757575),
      body: Container(
        child: 
        Center(
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/imagens/Logo.jpg',
                      width: 225,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 65)),
                    Text('Rental Car',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,)
                    ),
                  ],
                ),
              ],
            ),
            
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int _currentIndex = 0;

  PageController _pageController = PageController();
  List <Widget> _screens = [
    MenuBar(), Carro(), Info(), /*Login()*/
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF757575),

      body: 

        Container(
          child: 

          PageView(
            controller: _pageController,
            children: _screens,
            onPageChanged: _onPageChanged,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.grey[700],
            ),
            title: Text(
              'Menu',
              style: TextStyle(
                color: _selectedIndex == 0 ? Colors.white : Colors.grey[700],
              ),
            ),
            backgroundColor: Colors.grey[900],
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
              color: _selectedIndex == 1 ? Colors.white : Colors.grey[700],
            ),
            title: Text(
              'Alugue',
              style: TextStyle(
                color: _selectedIndex == 1 ? Colors.white : Colors.grey[700],
              ),
            ),
            backgroundColor: Colors.grey[900]
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range,
              color: _selectedIndex == 2 ? Colors.white : Colors.grey[700],
            ),
            title: Text(
              'Info',
              style: TextStyle(
                color: _selectedIndex == 2 ? Colors.white : Colors.grey[700],
              ),
            ),
            backgroundColor: Colors.grey[900]
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 3 ? Colors.white : Colors.grey[700],
            ),
            title: Text(
              'Configurações',
              style: TextStyle(
                color: _selectedIndex == 3 ? Colors.white : Colors.grey[700],
              ),
            ),
            backgroundColor: Colors.grey[900]
          )
        ],
        onTap: _onItemTapped,
      ),

    );
  }
}

//Terceira Tela - Sobre

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o Desenvolvedor', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),), 
        backgroundColor: Colors.black, 
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SobrePagina(),
    );
  }
}

//Quarta Tela - Carro

class Carro extends StatefulWidget {
  @override
  _CarroState createState() => _CarroState();
}

class _CarroState extends State<Carro> {

  String _chosenValue;
  final isSelected = <bool>[false, false, false];
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alugar Carro', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),), 
        backgroundColor: Colors.black, 
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF757575),

      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: _chosenValue,
                              style: TextStyle(color: Colors.black, fontSize: 18),
                                
                              items: <String>[
                                'Aventureiro',
                                'Conversível',
                                'Esportivo',
                                'Familiar',
                                'Furgão',
                                'Hatch',
                                'Jipe',
                                'Picape',
                                'Sedan',
                                'SUV',
                                'Van',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                                
                              hint: Text(
                                'Selecione uma Opção',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onChanged: (String value){
                                setState(() {
                                  _chosenValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  TextField(
                    style: Theme.of(context).textTheme.headline4,
                    decoration: InputDecoration(
                      hintText: 'Pesquise um modelo de preferência',
                      hintStyle: Theme.of(context).textTheme.headline3,
                      helperText: '',
                      helperStyle: Theme.of(context).textTheme.headline3,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pushNamed(context, 'Pedido');
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        //padding: EdgeInsets.all(10),
                        width: 200,
                        height: 310,
                        color: Colors.grey[300],
                        child: Row(
                          children:[
                            Image.network('https://i.picsum.photos/id/111/230/310.jpg?hmac=qVImkMlgXhBtN71LuUUo7JDKLhSvDtEmKcwKgCa9uCM'),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text('Lorem Ipsum', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text('Lorem Ipsum is simply dummy text of the printing and', style: TextStyle(fontSize: 16,),),
                                    SizedBox(height: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text('. Lorem'),
                                        Text('. Lorem Ipsum'),
                                        Text('. Lorem Ipsum is simply'),
                                        Text('. Lorem 2017'),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.directions_car, size: 40,),
                                        SizedBox(width: 12,),
                                        Text('5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        Icon(Icons.airline_seat_recline_normal, size: 40,),
                                        SizedBox(width: 12,),
                                        Image.network('https://cdn0.iconfinder.com/data/icons/work-from-home-glyph/75/2-256.png', scale: 6,),
                                        SizedBox(width: 12,),
                                        Image.network('https://cdn4.iconfinder.com/data/icons/car-parts-solid-elasto-font-next-2020/16/02_automatic-transmission-256.png', scale: 7,),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    ToggleButtons(
                                        color: Colors.black.withOpacity(0.60),
                                        selectedColor: Colors.white,
                                        selectedBorderColor: Colors.black,
                                        fillColor: Color(0xFF757575),
                                        splashColor: Color(0xFF757575),
                                        hoverColor: Color(0xFF757575),
                                        borderRadius: BorderRadius.circular(4.0),
                                        isSelected: isSelected,
                                        onPressed: (index) {
                                            setState(() {
                                                isSelected[index] = !isSelected[index];
                                            });
                                        },
                                        children: [
                                            Icon(Icons.favorite),
                                            Icon(Icons.visibility),
                                            Icon(Icons.notifications),
                                        ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                    );
                  },
                
                  itemCount: 6,
                ),
              ),
            ),

          ],
        ),
    );
  }
}

//Quinta Tela - Pedido
class Pedido extends StatefulWidget {
  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {

  String valueChoose;

  List listCidade = [
    'São Paulo', 'Campinas', 'Ribeirão Preto', 'Franca', 'São Carlos', 'Sertãozinho', 'Barretos', 'Cravinhos', 'Jardinópolis', 'Bonfim Paulista', 'Serra Azul'
  ];

  DateTime _date = DateTime(2021, 04, 01);

  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2021, 4),
      lastDate: DateTime(2023, 6),
      helpText: 'Selecione uma data',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  var _txtEmail = TextEditingController();
  var _txtCell = TextEditingController();
  var _txtNum = TextEditingController();
  var _txtNome = TextEditingController();
  var _txtValidade = TextEditingController();
  var _txtDigitos = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados do Pedido', style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black, 
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF757575),

      body: Container(
        padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: 400,
                      height: 50,
                      padding: EdgeInsets.only(left: 33,),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      child: DropdownButton(
                        hint: Text('Escolha o local de retirada do veículo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18,),),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                        iconSize: 40,
                        dropdownColor: Colors.black,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        value: valueChoose,
                        onChanged: (newValue){
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: listCidade.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 400, height: 50),
                child: ElevatedButton.icon(
                  onPressed: _selectDate,
                  icon: Icon(Icons.today, size: 24),
                  label: Text('Selecione uma data de retirada do veículo', style: TextStyle(fontSize: 18, color: Colors.white)),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),
                ),
              ),
              
              SizedBox(height: 20),
              Divider(
                color: Colors.black,
                thickness: 3,
              ),

              SizedBox(height: 20),
              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  hintText: 'Digite seu E-mail',
                  hintStyle: Theme.of(context).textTheme.headline3,
                  helperText: 'Insira um endereço de E-mail válido',
                  helperStyle: Theme.of(context).textTheme.headline3,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 1.0, color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtCell,
                decoration: InputDecoration(
                  labelText: 'Celular',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  hintText: 'Digite seu Celular',
                  hintStyle: Theme.of(context).textTheme.headline3,
                  helperText: '',
                  helperStyle: Theme.of(context).textTheme.headline3,
                  prefixIcon: const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 1.0, color: Colors.black),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 65,
                    onPressed: () {

                    },
                    icon: Image.network('https://cdn4.iconfinder.com/data/icons/payment-method/160/payment_method_card_visa-256.png',)
                  ),

                  SizedBox(width: 20),
                  IconButton(
                    iconSize: 65,
                    onPressed: () {

                    },
                    icon: Image.network('https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Mastercard-Curved.png',)
                  ),

                  SizedBox(width: 20),
                  IconButton(
                    iconSize: 65,
                    onPressed: () {

                    },
                    icon: Image.network('https://cdn4.iconfinder.com/data/icons/payment-method/160/payment_method_paypal-512.png',)
                  ),

                  SizedBox(width: 20),
                  IconButton(
                    iconSize: 65,
                    onPressed: () {

                    },
                    icon: Image.network('https://cdn4.iconfinder.com/data/icons/payment-method/160/payment_method_bitcoin-512.png',)
                  ),

                  SizedBox(width: 20),
                  IconButton(
                    iconSize: 65,
                    onPressed: () {

                    },
                    icon: Image.network('https://cdn2.iconfinder.com/data/icons/payment-method/480/payu-money-512.png',)
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Informações do Cartão', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                ],
              ),

              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 167, left: 167),
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
              ),

              SizedBox(height: 15),
              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtNum,
                maxLength: 16,
                decoration: InputDecoration(
                  labelText: 'Número do cartão',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: Theme.of(context).textTheme.headline3,
                  border: OutlineInputBorder(),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: const Icon(
                      Icons.payment,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                style: Theme.of(context).textTheme.headline4,
                controller: _txtNome,
                decoration: InputDecoration(
                  labelText: 'Nome do titular do cartão',
                  labelStyle: Theme.of(context).textTheme.headline5,
                  border: OutlineInputBorder(),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      style: Theme.of(context).textTheme.headline4,
                        controller: _txtValidade,
                        maxLength: 5,
                        decoration: InputDecoration(
                          labelText: 'Validade',
                          labelStyle: Theme.of(context).textTheme.headline5,
                          hintText: 'MM/YY',
                          hintStyle: Theme.of(context).textTheme.headline3,
                          border: OutlineInputBorder(),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                    )
                  ),

                  SizedBox(width: 40),

                  Expanded(
                    child: TextField(
                      style: Theme.of(context).textTheme.headline4,
                        controller: _txtDigitos,
                        maxLength: 4,
                        decoration: InputDecoration(
                          labelText: 'Últimos 4 dígitos',
                          labelStyle: Theme.of(context).textTheme.headline5,
                          hintText: '****',
                          hintStyle: Theme.of(context).textTheme.headline3,
                          border: OutlineInputBorder(),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: const Icon(
                              Icons.password,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                    )
                  ),
                ],
              ),

              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Finalizar(),
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }

  Widget Finalizar() {
    return Container(
      width: 320,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
        child: Text('Finalizar Pedido', style: Theme.of(context).textTheme.headline4,),
        onPressed: () {
          Navigator.pushNamed(context, 'Menu');
        },
      ),
    );
  }

}

// Sexta Tela - Informações

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),), 
        backgroundColor: Colors.black, 
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF757575),
      body: InfoPagina(),
    );
  }
}