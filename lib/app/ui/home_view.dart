import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/model/city_model.dart';
import 'package:open_weather_app/app/services/service.dart';
import 'package:open_weather_app/app/state/state_management.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final viewModal = watch(cityDetailsStateFuture);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: Colors.indigo[900],
        ),
        body: viewModal.Cities.isEmpty
            ? Center(
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                itemCount: viewModal.Cities.length,
                // itemCount: watch(cityDetailsStateFuture).data!.value!.list.length == 0,
                // itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            tileColor: Colors.lightBlue[600],
                            // title: Text(notes[index]['id']),
                            title: Text(
                                viewModal.Cities.elementAt(index)['name'] ?? '',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            subtitle: Text(
                                viewModal.Cities.elementAt(index)['country'] ??
                                    '',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ))
                    ],
                  );
                }));

    // body:Column(
    //   children: [
    //     Text(viewModal.Cities.length.toString()),
    //   ],
    // )
    // );
  }
}
