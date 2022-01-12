import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'city_detail_screen.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List data = [];

  getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/bbd19670-31f3-46cb-86c9-340c63acd06f'));
    try {
      setState(() {
        data = jsonDecode(response.body);
      });

      print('////////////data');
      print(data);
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(""),
              backgroundColor: Colors.indigo[900],
            ),
            drawer: const SideMenu(),
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
              Container(
                  child: data.length <= 0
                      ? Center(
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          // itemCount: watch(cityDetailsStateFuture).data!.value!.list.length == 0,
                          // itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
                                    margin: EdgeInsets.all(10),
                                    child: ListTile(
                                      tileColor: Colors.lightBlue[400],
                                      // title: Text(notes[index]['id']),
                                      title: Text(
                                          data.elementAt(index)['name'] ?? '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      subtitle: Text(
                                          data.elementAt(index)['country'] ??
                                              '',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CityDetailsScreen(
                                                                name: data.elementAt(
                                                                            index)[
                                                                        'name'] ??
                                                                    'Colombo')));
                                              },
                                              icon: const Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      // onTap: () {
                                      //   Navigator.of(context).push(
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               CityDetailsScreen(
                                      //                   name: data.elementAt(
                                      //                               index)[
                                      //                           'name'] ??
                                      //                       'Colombo')));
                                      //
                                      //   // Navigator.push(
                                      //   //   context,
                                      //   //   MaterialPageRoute(
                                      //   //       builder: (context) =>
                                      //   //           CityDetailsScreen(
                                      //   //               name: data.elementAt(
                                      //   //                       index)['name'] ??
                                      //   //                   'Colombo')),
                                      //   // );
                                      // },
                                    ))
                              ],
                            );
                          }))
            ])));
  }
}
