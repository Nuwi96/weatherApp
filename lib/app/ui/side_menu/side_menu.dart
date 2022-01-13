import 'package:flutter/material.dart';
import '../carousel_list.dart';
import '../home_view.dart';
import '../main_screen.dart';
import '../screen_one.dart';
import '../temperature.dart';

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
              'Weather Forecast',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color(0xff00008B),
            )
          ),
          ListTile(
            leading: Icon(Icons.house_sharp),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('City List'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.lock_clock),
            title: Text('5 Day / 3 Hour Forecast'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarouselList()),
            )},
          ),
          ListTile(
            leading: Icon(Icons.lock_clock),
            title: const Text('City Temperature'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TemCity()),
            )},
          ),
        ],
      ),
    );
  }
}