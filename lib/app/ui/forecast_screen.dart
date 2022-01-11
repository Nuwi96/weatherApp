import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weather_app/app/state/state_management.dart';
import 'package:open_weather_app/app/ui/side_menu/side_menu.dart';

class ForecastScreen extends ConsumerWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
        drawer: const SideMenu(),
        // appBar: AppBar(),
        body: Stack(children: <Widget>[
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
              child: watch(colombo5DayForecastDetails).colomboDetails.isEmpty
                  ? Center(
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  :
              Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 32.0,
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            // color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 20), blurRadius: 10.0),
                            ],
                            // image: DecorationImage(
                            // image: NetworkImage(car.image), fit: BoxFit.cover),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Tesla_Motors.svg/595px-Tesla_Motors.svg.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text("ddddddddd"
                                            // car.model,
                                            // style: kCardTitleStyle,
                                            ),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            'dsdss',
                                            // car.description,
                                            // style: kCardDescriptionTextStyle,
                                            textAlign: TextAlign.end,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
        ]));
  }
}
// ListView.builder( //TODO https://dev.to/irangareddy/carousels-in-flutter-4kmj carousel
//         // itemCount: watch(colombo5DayForecastDetails)
//         //     .colomboDetails[0]['list'].length.compareTo(0),
//
//         itemCount: 5.compareTo(0),
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               TextButton(
//                   onPressed: () => {
//                         // Navigator.push(
//                         // context,
//                         // MaterialPageRoute(builder: (context) => CityDetailsScreen(id: 5)),
//                         // )
//                       },
//                   child: Card(
//                       margin: EdgeInsets.all(50),
//                       child: ListTile(
//                         tileColor: Colors.lightBlue[600],
//                         title: Text( watch(colombo5DayForecastDetails)
//                             .colomboDetails[0]['list']
//                             .length.toString()),
//                         // title: Text(
//                         //     watch(colombo5DayForecastDetails)
//                         //             .colomboDetails
//                         //             .elementAt(index)['name'] ??
//                         //         '',
//                         //     style: const TextStyle(
//                         //         color: Colors.white,
//                         //         fontSize: 18)),
//                         subtitle: Text(
//                             watch(colombo5DayForecastDetails)
//                                     .colomboDetails
//                                     .elementAt(
//                                         index)['country'] ??
//                                 '',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15)),
//                       )))
//             ],
//           );
//         })

//                 )
//           ],
//         ));
//   }
// }
