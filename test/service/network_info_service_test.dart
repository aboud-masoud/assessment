import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exinity_assessment/services/general/network_info_service.dart';
import 'package:exinity_assessment/utils/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectivity extends Mock implements Connectivity {}

class MockInternetAddress extends Mock implements InternetAddress {}

void main() {
  late NetworkInfoService networkInfoService;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfoService = NetworkInfoService();
    networkInfoService.connectivity = mockConnectivity;
  });

  group('NetworkInfoService', () {
    test('initNetworkConnectionCheck emits network status changes', () {
      // Arrange: Simulating connectivity change events
      final connectivityStreamController = StreamController<List<ConnectivityResult>>();
      when(() => mockConnectivity.onConnectivityChanged).thenAnswer((_) => connectivityStreamController.stream);

      // Act: Listen for changes and start the service
      expectLater(networkInfoService.networkStateStreamControler.stream, emitsInOrder([true, false]));

      networkInfoService.initNetworkConnectionCheck();
      connectivityStreamController.add([ConnectivityResult.wifi]); // Connected
      connectivityStreamController.add([ConnectivityResult.none]); // Disconnected

      // Close stream controller after test
      connectivityStreamController.close();
    });

    test('checkConnectivityonLunching returns true when connected', () async {
      // Arrange: Mock connectivity check and internet lookup
      when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.wifi]);
      when(() => networkInfoService.lookup('google.com')).thenAnswer((_) async => [MockInternetAddress()]);

      // Act: Call the method
      final result = await networkInfoService.checkConnectivityonLunching();

      // Assert: Verify the result
      expect(result, isTrue);
    });

    test('checkConnectivityonLunching throws exception when not connected', () async {
      // Arrange: Simulate no connectivity
      when(() => mockConnectivity.checkConnectivity()).thenAnswer((_) async => []);

      // Act & Assert: Expect an exception due to no connectivity
      expect(() => networkInfoService.checkConnectivityonLunching(), throwsA(isA<InternetConnectionException>()));
    });

    test('_isConnected returns true for valid connection results', () {
      // Act & Assert: Check various connectivity results
      expect(networkInfoService.isConnected([ConnectivityResult.mobile]), isTrue);
      expect(networkInfoService.isConnected([ConnectivityResult.wifi]), isTrue);
      expect(networkInfoService.isConnected([ConnectivityResult.none]), isFalse);
    });

    test('_internetLookupCheck returns true for successful lookup', () async {
      // Arrange: Mock a successful lookup
      when(() => networkInfoService.lookup('google.com')).thenAnswer((_) async => [MockInternetAddress()]);

      // Act: Call the method
      final result = await networkInfoService.internetLookupCheck();

      // Assert: Verify the result
      expect(result, isTrue);
    });

    test('_internetLookupCheck returns false on lookup failure', () async {
      // Arrange: Mock a failed lookup
      when(() => networkInfoService.lookup('google.com'))
          .thenThrow(InternetConnectionException(message: 'Failed lookup'));

      // Act: Call the method
      final result = await networkInfoService.internetLookupCheck();

      // Assert: Verify the result
      expect(result, isFalse);
    });
  });
}
