part of 'weather_bloc_bloc.dart';

class WeatherBlocEvent extends Equatable {
  final bool isLoading;
  final String cityName;
  final String weatherCondition;
  final String temperature;
  final String photo;
  const WeatherBlocEvent({
    this.isLoading = false,
    this.cityName = emptyString,
    this.weatherCondition = emptyString,
    this.temperature = emptyString,
    this.photo = emptyString,
  });

  @override
  List<Object?> get props =>
      [isLoading, cityName, weatherCondition, temperature, photo];
}
