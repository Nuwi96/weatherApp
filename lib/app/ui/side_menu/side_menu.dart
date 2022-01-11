import 'package:flutter/material.dart';

import '../carousel_list.dart';
import '../forecast_screen.dart';
import '../home_view.dart';
import '../main_screen.dart';
import '../screen_one.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
            )
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('City List'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('5 Day / 3 Hour Forecast'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarouselList()),
            )},
          ),
        ],
      ),
    );
  }
}