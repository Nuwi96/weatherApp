import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/model/city_model.dart';
import 'package:open_weather_app/app/services/service.dart';

final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());
final colomboDetails = ChangeNotifierProvider<FetchColomboCityDetails>((ref)=>FetchColomboCityDetails());
// final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());









