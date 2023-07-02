import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/weather_bloc/weather_bloc_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {
  final bool successful;
  final PermissionStatus permissionStatus;
  final String weatherCondition;

  MockGeolocator({
    this.successful = true,
    this.permissionStatus = PermissionStatus.granted,
    this.weatherCondition = 'Clear',
  });
  @override
  Future<Position> getCurrentPosition(
      {LocationSettings? locationSettings}) async {
    if (successful) {
      return Position(
        latitude: 40.7128,
        longitude: -74.0060,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
      );
    } else {
      throw Exception('Error getting current position');
    }
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return LocationPermission.always;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return LocationPermission.always;
  }

  @override
  Future<bool> openLocationSettings() async {
    return true;
  }

  @override
  Future<bool> openAppSettings() async {
    return true;
  }
}

void main() {
  group('WeatherBlocBloc tests', () {
    test('WeatherBlocBloc can be instantiated', () {
      final bloc = WeatherBlocBloc(GeolocatorPlatform.instance);
      expect(bloc.state, const WeatherBlocState());
    });

    test('WeatherBlocBloc handles successful weather retrieval', () async {
      final bloc = WeatherBlocBloc(MockGeolocator());
      final expectedStates = [
        WeatherBlocState.loading(),
        WeatherBlocState.loaded(
          'New York',
          'Clear',
          '20',
          AnimationManager.aSunny,
        ),
      ];

      final actualStates = <WeatherBlocState>[];

      final subscription = bloc.stream.listen((state) {
        actualStates.add(state);
      });

      bloc.add(const WeatherBlocEvent());

      await Future.delayed(Duration.zero);

      expect(actualStates.length, equals(expectedStates.length));
      for (int i = 0; i < actualStates.length; i++) {
        expect(actualStates[i], equals(expectedStates[i]));
      }

      subscription.cancel();
    });

    test('WeatherBlocBloc handles permission denied error', () async {
      final bloc = WeatherBlocBloc(
          MockGeolocator(permissionStatus: PermissionStatus.denied));
      final expectedState = [
        WeatherBlocState.loading(),
        WeatherBlocState.error('Error retrieving weather')
      ];

      expectLater(bloc.stream, emitsInOrder(expectedState));

      bloc.add(const WeatherBlocEvent());
    });

    test('WeatherBlocBloc handles weather retrieval error', () async {
      final bloc = WeatherBlocBloc(MockGeolocator(successful: false));
      final expectedState = [
        WeatherBlocState.loading(),
        WeatherBlocState.error('Error retrieving weather')
      ];

      final actualStates = <WeatherBlocState>[];

      bloc.stream.listen((state) {
        actualStates.add(state);
      });

      bloc.add(const WeatherBlocEvent());
      await Future.delayed(Duration.zero);

      expect(actualStates, expectedState);
    });

    test('WeatherBlocBloc handles unknown weather condition', () async {
      final bloc = WeatherBlocBloc(MockGeolocator(weatherCondition: 'Unknown'));
      final expectedState = [
        WeatherBlocState.loading(),
        WeatherBlocState.error('Error retrieving weather')
      ];

      expectLater(bloc.stream, emitsInOrder(expectedState));

      bloc.add(const WeatherBlocEvent());
    });
  });
}
