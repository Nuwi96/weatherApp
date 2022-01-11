import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:http/http.dart' as http;
class CarouselCard extends ConsumerWidget {
  var car;
  var data;

  CarouselCard({Key? key, required this.car ,required this.data}) : super(key: key);
  @override
  void initState() {
    search();
    print('//////////////////////////data');
    print(data);
  }

  // int currentPage = 0;
  // Map data={};
  // var text = 'Colombo';
  search() async {
    print('//////////////////////////data');
    print(data);
    // text = searchController.text.toLowerCase();
    // http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q='+ text+'&appid=cbd8206380cf907632707690f4d9971b'));
    // data = jsonDecode(response.body);
    // print(jsonDecode(response.body));
    // print(data['city']['name']);
    // setState(() async {
    //   var text = searchController.text.toLowerCase();
    //   print(text);
    //
    //
    // });
  }
  @override
  Widget build(BuildContext context,watch) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                 offset: Offset(0, 20), blurRadius: 10.0),
            ],
            // image: DecorationImage(
            //     colorFilter: ColorFilter.mode(
            //         Colors.black.withOpacity(0.75), BlendMode.dstATop),
            //     image:AssetImage('assets/images/cloud.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data['list'][car]['dt_txt']
                            ,style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic)
                        ),

                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(
                                  "http://openweathermap.org/img/w/" +
                                      data['list'][car]['weather'][0]['icon'] +
                                      ".png",
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              //apply margin and padding using Container Widget.
                              //   padding: const EdgeInsets.all(20),
                                //You can use EdgeInsets like above
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                child: Text(
                                    data['list'][car]['weather'][0]['description'],
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900))),
                          ],
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
                                data['list'][car]['wind']['speed'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
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
                                data['list'][car]['main']['temp'].toString(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            )
                          ],
                        ),




                        // Text(
                        //   data['list'][car]['weather'][0]['description'],
                        //     style: const TextStyle(
                        // fontSize: 20.0,
                        // color: Colors.black,
                        // fontWeight: FontWeight.w900,
                        //     fontStyle: FontStyle.italic)
                        // ),
                        // Text(
                        //   data['list'][car]['wind']['speed'].toString(),
                        //     style: const TextStyle(
                        // fontSize: 20.0,
                        // color: Colors.black,
                        // fontWeight: FontWeight.w900,
                        //     fontStyle: FontStyle.italic)
                        // ),
                        // Container(
                        //   height: 100,
                        //   width: MediaQuery.of(context).size.width * 0.6,
                        //   child: Text(
                        //     data['list'][car]['main']['temp'].toString(),style: const TextStyle(
                        //   fontSize: 20.0,
                        //   color: Colors.black,
                        //   fontWeight: FontWeight.w900,
                        //       fontStyle: FontStyle.italic),
                        //     textAlign: TextAlign.start,
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 5,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
