import 'package:flutter/material.dart';
import '../carousel_list.dart';
import '../home_view.dart';
import '../main_screen.dart';
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
            leading: const Icon(Icons.house_sharp),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('City List'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_clock),
            title: const Text('5 Day / 3 Hour Forecast'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarouselList()),
            )},
          ),
          ListTile(
            leading: const Icon(Icons.ten_mp),
            title: const Text('City Temperature'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TemCity()),
            )},
          )
        ],
      ),
    );
  }
}