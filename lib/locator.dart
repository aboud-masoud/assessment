import 'package:dio/dio.dart';
import 'package:exinity_assessment/presentations/market/bloc/market_bloc.dart';
import 'package:exinity_assessment/services/general/network_info_service.dart';
import 'package:exinity_assessment/services/symbol_service.dart';
import 'package:exinity_assessment/utils/rest_api/http_interceptor.dart';
import 'package:exinity_assessment/utils/rest_api/http_repository.dart';
import 'package:exinity_assessment/utils/sockets/web_socket_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.pushNewScope();
  locator.registerLazySingleton(NetworkInfoService.new);
  locator.registerFactory<SymbolService>(SymbolService.new);
  locator.registerFactory<Dio>(Dio.new);

  locator.registerFactory<HttpInterceptor>(HttpInterceptor.new);
  locator.registerSingleton<HttpRepository>(HttpRepository());
  locator.registerSingleton<WebSocketClient>(WebSocketClient());
  locator.registerFactory<MarketBloc>(MarketBloc.new);
}
