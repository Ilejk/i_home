import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:i_home/src/domain/core/weather_bloc/weather_bloc_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/key.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:mockito/mockito.dart';

class MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

class MockResponse extends Mock implements http.Response {
  @override
  int get statusCode => super.noSuchMethod(Invocation.getter(#statusCode),
      returnValue: 200, returnValueForMissingStub: 200);
  @override
  String get body => super.noSuchMethod(Invocation.getter(#body),
      returnValue:
          '{"name": "City", "weather": [{"main": "Condition"}], "main": {"temp": 280.0}}',
      returnValueForMissingStub:
          '{"name": "City", "weather": [{"main": "Condition"}], "main": {"temp": 280.0}}');
}

void main() {
  group('WeatherBlocBloc', () {
    late WeatherBlocBloc weatherBloc;
    late MockGeolocatorPlatform mockGeolocator;

    setUp(() {
      mockGeolocator = MockGeolocatorPlatform();
      weatherBloc = WeatherBlocBloc(mockGeolocator);
    });

    tearDown(() {
      weatherBloc.close();
    });

    blocTest<WeatherBlocBloc, WeatherBlocState>(
      'emits correct states when WeatherBlocEvent is added',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(const WeatherBlocEvent()),
      expect: () => [
        const WeatherBlocState(isLoading: true),
        WeatherBlocState.loaded(
          'City',
          'Condition',
          '7',
          ImageManager.wSunny,
        ),
      ],
      verify: (_) {
        verify(mockGeolocator.getCurrentPosition()).called(1);
        verify(http.get(Uri.parse(
                'https://api.openweathermap.org/data/2.5/weather?lat=0.0&lon=0.0&appid=$API_KEY')))
            .called(1);
      },
    );

    blocTest<WeatherBlocBloc, WeatherBlocState>(
      'emits error state when API request fails',
      build: () => weatherBloc,
      act: (bloc) => bloc.add(const WeatherBlocEvent()),
      expect: () => [
        const WeatherBlocState(isLoading: true),
        const WeatherBlocState(error: 'Error retrieving weather'),
      ],
      verify: (_) {
        verify(mockGeolocator.getCurrentPosition()).called(1);
        verify(http.get(Uri.parse(
                'https://api.openweathermap.org/data/2.5/weather?lat=0.0&lon=0.0&appid=$API_KEY')))
            .called(1);
      },
    );
  });
}
