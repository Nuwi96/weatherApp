import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_app/app/model/city_model.dart';
import 'package:open_weather_app/app/services/service.dart';

final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());
// final cityDetailsStateFuture = ChangeNotifierProvider<FetchCityDetails>((ref)=>FetchCityDetails());





// final cityDetailsStateFuture = FutureProvider ((ref) async {
//   return fetchCityDetails();
// });



