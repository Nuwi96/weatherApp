import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'package:http/http.dart' as http;

class TemCity extends StatefulWidget {
  const TemCity({Key? key}) : super(key: key);

  @override
  _TemCityState createState() => _TemCityState();
}

class _TemCityState extends State<TemCity> {
  TextEditingController searchController = TextEditingController();
  Map data = {};

  search() async {
    var text = 'Colombo';
    var searchText = searchController.text.toLowerCase();
    print(searchText);
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=' +
            ('' == searchText ? text : searchText) +
            '&appid=cbd8206380cf907632707690f4d9971b'));
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
      search();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                drawer: const SideMenu(),
                appBar: AppBar(
                  backgroundColor: Colors.indigo[900],
                  elevation: 0,
                  leading: Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                ),
                body: Stack(children: [
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
                  Center(
                      child: Container(
                          child: Column(children: [
                    Padding(
                      // fromLTRB(right, bottom, left, top)
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
                      child: TextField(
                        autofocus: false,
                        controller: searchController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            hintText: " Search...",
                            // border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: Color.fromRGBO(93, 25, 72, 1),
                              onPressed: () {
                                search();
                              },
                            )),
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                        onChanged: (content) {
                          search();
                        },
                      ),
                    ),
                    SizedBox(
                        width: 350.0,
                        height: 450.0,
                        child: Card(
                            color: Colors.transparent,
                            child: (200 == data['cod'])
                                ? Column(children: [
                                    Text(
                                        200 == data['cod']
                                            ? data['name']
                                            : 'Colombo',
                                        style: const TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                    const Divider(
                                      color: Colors.white,
                                      height: 50,
                                    ),
                                    Text('Min Temperature',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                    Row(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.all(25.0),
                                            child: Icon(
                                              FontAwesomeIcons.temperatureLow,
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
                                            (200 == data['cod'])
                                                ? data['main']['temp_min']
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
                                    Text('Max Temperature',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                    Row(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.all(15.0),
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
                                              vertical: 5.0, horizontal: 50.0),
                                          child: Text(
                                            (200 == data['cod'])
                                                ? data['main']['temp_max']
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
                                  ])
                                : Container(
                                    child: Center(
                                    child: Text('No data available',
                                        style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                  ))))
                  ])))
                ]))));
  }
}
