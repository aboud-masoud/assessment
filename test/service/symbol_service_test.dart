import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/model/restful/symbol_list.dart';
import 'package:exinity_assessment/services/symbol_service.dart';
import 'package:exinity_assessment/utils/constants/connection_constant.dart';
import 'package:exinity_assessment/utils/constants/app_constant.dart';
import 'package:exinity_assessment/utils/rest_api/http_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpRepository extends Mock implements HttpRepository {}

void main() {
  late SymbolService symbolService;
  late MockHttpRepository mockHttpRepository;

  setUp(() {
    mockHttpRepository = MockHttpRepository();
    locator.registerSingleton<HttpRepository>(mockHttpRepository);

    symbolService = SymbolService()..repository = mockHttpRepository;
  });

  tearDown(() async {
    await locator.reset();
  });

  group('SymbolService', () {
    test('getListOfSymbol returns a list of symbols when successful', () async {
      // Arrange: Mocking the API response
      final mockResponse = [
        {"symbol": "AAPL", "displaySymbol": "Apple Inc", "description": "Apple Inc Stock"},
        {"symbol": "GOOGL", "displaySymbol": "Alphabet Inc", "description": "Alphabet Inc Stock"}
      ];

      when(() => mockHttpRepository.callRequest(
            requestType: RequestType.get,
            methodName: ConnectionConstant.getSybmol,
            queryParam: {"exchange": "oanda", "token": AppConstant.token},
          )).thenAnswer((_) async => mockResponse);

      // Act: Call the method
      final result = await symbolService.getListOfSymbol();

      // Assert: Verify the result
      expect(result, isA<List<SymbolListResponseModel>>());
      expect(result.length, 2);
      expect(result[0].symbol, "AAPL");
      expect(result[1].symbol, "GOOGL");
    });

    test('getListOfSymbol throws an error when API call fails', () async {
      // Arrange: Mocking an exception
      when(() => mockHttpRepository.callRequest(
            requestType: RequestType.get,
            methodName: ConnectionConstant.getSybmol,
            queryParam: {"exchange": "oanda", "token": AppConstant.token},
          )).thenThrow(Exception("Failed to fetch symbols"));

      // Act & Assert: Call the method and expect an exception
      expect(() => symbolService.getListOfSymbol(), throwsException);
    });
  });
}
