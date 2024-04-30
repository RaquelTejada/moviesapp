import 'package:flutter/material.dart';
import 'package:namer_app/pages/home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyLoginPage> createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MyLoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    bool buttonDisabled = email.isEmpty || password.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Página de Login",
          style: TextStyle(color: Color.fromRGBO(71, 146, 93, 1)),
        ),
        backgroundColor: Color.fromRGBO(151, 212, 223, 1),
      ),
      body: Container(
        color: Color.fromRGBO(151, 212, 223, 1),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('TODOCINE',
                      style: TextStyle(
                        fontSize: 40.0,
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
                      )),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 60),
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
                        onPressed: buttonDisabled
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                      title: 'Hola Mundo',
                                    ),
                                  ),
                                );
                              },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromRGBO(71, 146, 93, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
