import 'package:flutter/material.dart';
import 'package:namer_app/pages/login_page.dart';
import 'package:namer_app/pages/movies_page.dart';
import 'package:namer_app/pages/signup_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage('/assets/avatar.jpg'),
                ),
            accountName: Text("Nombre de Usuario"),
            accountEmail: Text("usuario@gmail.com"),
            decoration: BoxDecoration(
              color: Color.fromRGBO(151, 212, 223, 1),
            ),
          ),
          ListTile(
            title: Text('Películas & Series'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyMoviesPage(
                    title: 'Hola Mundo',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Regístrate'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MySignUpPage(
                    title: 'Hola Mundo',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyLoginPage(
                    title: 'Hola Mundo',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
