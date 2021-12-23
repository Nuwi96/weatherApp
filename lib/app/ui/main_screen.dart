import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';

class MainScreen extends ConsumerWidget {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
        drawer: SideMenu(),
        // appBar: AppBar(),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Stack(
                children: [
                  Container(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: Builder(
                        builder: (context) => // Ensure Scaffold is in context
                            IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer()),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(
                      0.0,
                      1.0,
                    ),
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: OverflowBox(
                        minWidth: 0.0,
                        maxWidth: MediaQuery.of(context).size.width,
                        minHeight: 0.0,
                        maxHeight: (MediaQuery.of(context).size.height - 280),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              height: double.infinity,
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                              child: Column(
                                            children: [
                                              Text(
                                                  watch(colomboDetails)
                                                      .colomboDetails[0]["name"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20.0)),
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Image.network(
                                                        "http://openweathermap.org/img/w/" +
                                                            watch(colomboDetails)
                                                                        .colomboDetails[
                                                                    0]["weather"]
                                                                [0]["icon"] +
                                                            ".png",
                                                        height: 100,
                                                        width: 80,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  Text(watch(colomboDetails)
                                                      .colomboDetails[0]
                                                          ["weather"][0]["main"]
                                                      .toString()),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.black,
                                                height: 50,
                                              ),
                                              Text(
                                                "Wind Speed",
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Image.asset(
                                                        'assets/images/wind.png',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.fill),
                                                    // child: Image.network(
                                                    //   "http://openweathermap.org/img/w/" +
                                                    //       watch(colomboDetails)
                                                    //           .colomboDetails[
                                                    //       0]["weather"]
                                                    //       [0]["icon"] +
                                                    //       ".png",
                                                    //   height: 100,
                                                    //   width: 80,
                                                    //   fit: BoxFit.cover,
                                                    // )
                                                  ),
                                                  Text(
                                                    watch(colomboDetails)
                                                        .colomboDetails[0]
                                                            ["wind"]["speed"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.black,
                                                height: 50,
                                              ),
                                              Text(
                                                "Temperature",
                                                style:
                                                    TextStyle(fontSize: 20.0),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: Image.asset(
                                                        'assets/images/temp.jpg',
                                                        width: 80,
                                                        height: 60,
                                                        fit: BoxFit.fill),
                                                  ),
                                                  Text(
                                                    watch(colomboDetails)
                                                        .colomboDetails[0]
                                                            ["main"]["temp"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ]));
  }
}
