import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenScreenState createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<MainScreen> {
  Map data = {};

  getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Colombo&appid=cbd8206380cf907632707690f4d9971b'));
    try {
      setState(() {
        data = jsonDecode(response.body);
      });
    } catch (e) {
      return 'failed';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: const SideMenu(),
            // appBar: AppBar(),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.75), BlendMode.dstATop),
                      image: AssetImage('assets/images/cloud.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                ),
                Center(
                    child: data.isEmpty
                        ? Center(
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SizedBox(
                            width: 350.0,
                            height: 500.0,
                            child: Card(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Text(
                                        (data.isNotEmpty)
                                            ? data["name"].toString()
                                            : '',
                                        style: const TextStyle(
                                            fontSize: 38.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontStyle: FontStyle.italic)),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.network(
                                              (data.isNotEmpty)
                                                  ? "http://openweathermap.org/img/w/" +
                                                      data["weather"][0]
                                                          ["icon"] +
                                                      ".png"
                                                  : '',
                                              height: 100,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            )),
                                        Flexible(
                                          child: Container(
                                              //apply margin and padding using Container Widget.
                                              padding: const EdgeInsets.all(20),
                                              //You can use EdgeInsets like above
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 15.0),
                                              child: Text(
                                                  (data.length > 0)
                                                      ? data["weather"][0]
                                                              ["description"]
                                                          .toString()
                                                      : '',
                                                  style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900))),
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Icon(
                                              FontAwesomeIcons.wind,
                                              size: 50, //Icon Size
                                              color:
                                                  Colors.white, //Color Of Icon
                                            )),
                                        Container(
                                          //apply margin and padding using Container Widget.
                                          padding: const EdgeInsets.all(20),
                                          //You can use EdgeInsets like above
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 50.0),
                                          child: Text(
                                            (data.length > 0)
                                                ? data["wind"]["speed"]
                                                    .toString()
                                                : '',
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Icon(
                                              FontAwesomeIcons.temperatureHigh,
                                              size: 50, //Icon Size
                                              color:
                                                  Colors.white, //Color Of Icon
                                            )),
                                        Container(
                                          //apply margin and padding using Container Widget.
                                          padding: const EdgeInsets.all(20),
                                          //You can use EdgeInsets like above
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 25.0),
                                          child: Text(
                                            (data.length > 0)
                                                ? data["main"]["temp"]
                                                    .toString()
                                                : '',
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ))
              ],
            )));
  }
}
