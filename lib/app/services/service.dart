import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/model/city_model.dart';
import 'package:open_weather_app/app/util/util_api.dart';
import 'package:http/http.dart' as http;
// final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());


class FetchCityDetails extends ChangeNotifier {
  List<CityModel> cityModel = [];
  List Cities = [];
  FetchCityDetails(){
    print(cityModel);
    print("Heloooooooooooooooooooooo");
    getData();
  }

  Future getData() async {
    http.Response response = await http.get(Uri.parse(API_DETAILS_URL));
    List items = jsonDecode(response.body);
    for(int i=0; i< items.length; i++){
      Cities.add(items[i]);
    }
  }

}






