import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        // appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 1,
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
                        leading: Builder(builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer()
                        ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.0,1.0,),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height/4),
                          child: Stack(
                            children:<Widget> [
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 15,left: 20,right: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text("Heloooooooooooooooooo"),
                                            ),
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
            )
          ],
        ));
  }
}
