import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:i_home/src/presentation/utils/constnants/key.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:permission_handler/permission_handler.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final GeolocatorPlatform geolocator;
  WeatherBlocBloc(this.geolocator) : super(const WeatherBlocState()) {
    on<WeatherBlocEvent>(_getWeatherEvent);
  }
  void _getWeatherEvent(
      WeatherBlocEvent event, Emitter<WeatherBlocState> emit) async {
    try {
      emit(WeatherBlocState.loading());
      var status = await Permission.location.request();
      if (status.isDenied) {
        emit(WeatherBlocState.error('Permision denied'));
        return;
      }
      final position = await geolocator.getCurrentPosition();
      const apiKey = API_KEY;
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      final response = await http.get(Uri.parse(apiUrl));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final cityName = weatherData['name'];
        final weatherCondition = weatherData['weather'][0]['main'];
        final temperature =
            (weatherData['main']['temp'] - 273.15).toStringAsFixed(0);
        String photoType = ImageManager.wSunny;
        if (weatherCondition == 'Thunderstorm') {
          photoType = ImageManager.wStormy;
        } else if (weatherCondition == 'Drizzle') {
          photoType = ImageManager.wRainy;
        } else if (weatherCondition == 'Rain') {
          photoType = ImageManager.wRainy;
        } else if (weatherCondition == 'Snow') {
          photoType = ImageManager.wSnowy;
        } else if (weatherCondition == 'Clear') {
          photoType = ImageManager.wSunny;
        } else if (weatherCondition == 'Clouds') {
          photoType = ImageManager.wCloudy;
        } else if (weatherCondition == 'Atmosphere') {
          photoType = ImageManager.wCloudy;
        }

        emit(WeatherBlocState.loaded(
          cityName,
          weatherCondition,
          temperature,
          photoType,
        ));
      } else {
        emit(WeatherBlocState.error('Error retrieving weather'));
        print('error');
      }
    } catch (e) {
      emit(WeatherBlocState.error('Error retrieving weather'));
      print('chuj');
    }
  }
}
