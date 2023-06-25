import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/device_bloc/device_bloc.dart';
import 'package:i_home/src/domain/repo/device_repository.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('DeviceBloc', () {
    late DeviceRepository deviceRepository;
    late DeviceBloc deviceBloc;
    late BuildContext mockContext;
    setUp(() {
      mockContext = MockBuildContext();
      deviceRepository = DeviceRepository(mockContext);
      deviceBloc = DeviceBloc(deviceRepository);
    });

    tearDown(() {
      deviceBloc.close();
    });

    test('initial state should be DeviceState with isOnValue as false', () {
      expect(deviceBloc.state.isOnValue, false);
    });

    blocTest<DeviceBloc, DeviceState>(
      'emits DeviceState with updated isOnValue when SwitchValueEvent is added',
      build: () => deviceBloc,
      act: (bloc) => bloc.add(const SwitchValueEvent(0, true)),
      expect: () => [const DeviceState(isOnValue: true)],
    );
  });
}
