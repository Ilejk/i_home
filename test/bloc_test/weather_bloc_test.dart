import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:i_home/src/domain/core/weather_bloc/weather_bloc_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/key.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late WeatherBlocBloc weatherBloc;
  late GeolocatorPlatform geolocatorPlatform;

  group('WeatherBlocBloc', () {
    setUp(() {
      geolocatorPlatform = MockGeolocatorPlatform();
      weatherBloc = WeatherBlocBloc(geolocatorPlatform);
    });

    tearDown(() {
      weatherBloc.close();
    });

    test('emits the correct state when WeatherBlocEvent is added', () async {
      const expectedState = [
        WeatherBlocState(isLoading: true),
        WeatherBlocState(isLoading: false),
      ];
      final position = await geolocatorPlatform.getCurrentPosition();
      const apiKey = API_KEY;
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';

      when(geolocatorPlatform.getCurrentPosition())
          .thenAnswer((_) async => Position(
                latitude: 0,
                longitude: 0,
                accuracy: 0,
                altitude: 0,
                timestamp: DateTime.now(),
                speed: 0,
                speedAccuracy: 0,
                heading: 0,
              ));

      when(http.get(Uri.parse(apiUrl))).thenAnswer((_) async => http.Response(
          '{"name":"London","weather":[{"main":"Cloudy"}],"main":{"temp":293.15}}',
          200));

      blocTest<WeatherBlocBloc, WeatherBlocState>(
        'emits the correct state when WeatherBlocEvent is added',
        build: () => weatherBloc,
        act: (bloc) => bloc.add(const WeatherBlocEvent()),
        expect: () => expectedState,
      );
    });

    test('emits error state when permission is denied', () {
      const expectedState = [
        WeatherBlocState(isLoading: true),
        WeatherBlocState(error: 'Permission denied'),
      ];

      when(geolocatorPlatform.getCurrentPosition())
          .thenThrow(const PermissionDeniedException('permision denied'));

      blocTest<WeatherBlocBloc, WeatherBlocState>(
        'emits error state when permission is denied',
        build: () => weatherBloc,
        act: (bloc) => bloc.add(const WeatherBlocEvent()),
        expect: () => expectedState,
      );
    });

    test('emits error state when API request fails', () async {
      const expectedState = [
        WeatherBlocState(isLoading: true),
        WeatherBlocState(error: 'Error retrieving weather'),
      ];
      final position = await geolocatorPlatform.getCurrentPosition();
      const apiKey = API_KEY;
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey';
      when(geolocatorPlatform.getCurrentPosition())
          .thenAnswer((_) async => Position(
                latitude: 0,
                longitude: 0,
                accuracy: 0,
                altitude: 0,
                timestamp: DateTime.now(),
                speed: 0,
                speedAccuracy: 0,
                heading: 0,
              ));

      when(http.get(Uri.parse(apiUrl)))
          .thenAnswer((_) async => http.Response('Error', 500));

      blocTest<WeatherBlocBloc, WeatherBlocState>(
        'emits error state when API request fails',
        build: () => weatherBloc,
        act: (bloc) => bloc.add(const WeatherBlocEvent()),
        expect: () => expectedState,
      );
    });
  });
}
