import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:i_home/src/presentation/utils/constnants/key.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../presentation/utils/constnants/constants.dart';

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
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        final cityName = weatherData['name'];
        final weatherCondition = weatherData['weather'][0]['main'];
        final temperature =
            (weatherData['main']['temp'] - 273.15).toStringAsFixed(0);
        String animationType = AnimationManager.aSunny;
        switch (weatherCondition) {
          case 'Thunderstorm':
            animationType = AnimationManager.aStormy;
            break;
          case 'Drizzle':
          case 'Rain':
            animationType = AnimationManager.aRainy;
            break;
          case 'Snow':
            animationType = AnimationManager.aSnowy;
            break;
          case 'Clear':
            animationType = AnimationManager.aSunny;
            break;
          case 'Mist':
            animationType = AnimationManager.aMisty;
            break;
          case 'Clouds':
            animationType = AnimationManager.aCloudy;
            break;
          default:
            animationType = AnimationManager.aSunnyAndCloudy;
            break;
        }

        emit(WeatherBlocState.loaded(
          cityName,
          weatherCondition,
          temperature,
          animationType,
        ));
      } else {
        emit(WeatherBlocState.error('Error retrieving weather'));
      }
    } catch (e) {
      emit(WeatherBlocState.error('Error retrieving weather'));
    }
  }
}
