part of 'weather_bloc_bloc.dart';

class WeatherBlocState {
  final bool isLoading;
  final String cityName;
  final String weatherCondition;
  final String temperature;
  final String error;
  final String photo;

  const WeatherBlocState({
    this.cityName = '',
    this.error = '',
    this.isLoading = false,
    this.temperature = '',
    this.weatherCondition = '',
    this.photo = '',
  });

  factory WeatherBlocState.loading() {
    return const WeatherBlocState(isLoading: true);
  }
  factory WeatherBlocState.loaded(String cityName, String weatherCondition,
      String temperature, String photo) {
    return WeatherBlocState(
      cityName: cityName,
      weatherCondition: weatherCondition,
      temperature: temperature,
      photo: photo,
    );
  }
  factory WeatherBlocState.error(String error) {
    return WeatherBlocState(error: error);
  }
}
