import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
        drawer: const SideMenu(),
        // appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.75), BlendMode.dstATop),
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
                child: SizedBox(
                  width: 300.0,
                  height: 500.0,
                  child: Card(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Text(
                              watch(colomboDetails)
                                  .colomboDetails[0]["name"]
                                  .toString(),
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
                                    "http://openweathermap.org/img/w/" +
                                        watch(colomboDetails).colomboDetails[0]
                                        ["weather"][0]["icon"] +
                                        ".png",
                                    height: 100,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  )),
                              Container(
                                //apply margin and padding using Container Widget.
                                  padding: const EdgeInsets.all(20),
                                  //You can use EdgeInsets like above
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                  child: Text(
                                      watch(colomboDetails)
                                          .colomboDetails[0]["weather"][0]
                                      ["description"]
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900))),
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
                                    color: Colors.white, //Color Of Icon
                                  )),
                              Container(
                                //apply margin and padding using Container Widget.
                                padding: const EdgeInsets.all(20),
                                //You can use EdgeInsets like above
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 50.0),
                                child: Text(
                                  watch(colomboDetails)
                                      .colomboDetails[0]["wind"]["speed"]
                                      .toString(),
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
                                    color: Colors.white, //Color Of Icon
                                  )),
                              Container(
                                //apply margin and padding using Container Widget.
                                padding: const EdgeInsets.all(20),
                                //You can use EdgeInsets like above
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 25.0),
                                child: Text(
                                  watch(colomboDetails)
                                      .colomboDetails[0]["main"]["temp"]
                                      .toString(),
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
        ));
  }
}
