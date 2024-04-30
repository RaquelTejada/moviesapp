import 'package:flutter/material.dart';
import 'package:namer_app/pages/login_page.dart';
import 'package:namer_app/pages/navbar.dart';
import 'package:namer_app/pages/movies_page.dart';
import 'package:namer_app/pages/signup_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showMessage = false;

  void toggleMessage() {
    setState(() {
      showMessage = !showMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(151, 223, 195, 1),
          actions: <Widget>[
            IconButton(
              color: Colors.transparent,
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
        drawer: NavBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/blue-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      'TODOCINE',
                      style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(88, 180, 116, 1),
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FractionallySizedBox(
                      widthFactor: 0.55,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 242, 248, 161),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyMoviesPage(
                                        title: 'Hola Mundo',
                                      )),
                            );
                          },
                          child: Text(
                            'Películas & Series',
                            style: TextStyle(
                                color: Color.fromRGBO(71, 146, 93, 1),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Arial',
                                fontSize: 16.0),
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.55,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 242, 248, 161),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: toggleMessage,
                        child: Text(
                          showMessage ? 'Ocultar mensaje' : 'Mostrar mensaje',
                          style: TextStyle(
                              color: Color.fromRGBO(71, 146, 93, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  if (showMessage)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Mensaje para demostrar que está bien',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16.0,
                            color: Colors.black,
                          )),
                    ),
                  SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: 0.55,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 242, 248, 161),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySignUpPage(
                                      title: 'Hola Mundo',
                                    )),
                          );
                        },
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              color: Color.fromRGBO(71, 146, 93, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial',
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Ya tienes una cuenta creada?",
                          style: TextStyle(fontSize: 15)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyLoginPage(
                                        title: 'Hola Mundo',
                                      )),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromRGBO(71, 146, 93, 1),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  SizedBox(height: 40),
                ]),
          ),
        ));
  }
}
