import 'package:exinity_assessment/utils/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            settings: RouteSettings(arguments: settings.arguments),
            transitionDuration: const Duration(milliseconds: 100),
            pageBuilder: (_, __, ___) => routes[settings.name]!);
      },
      initialRoute: RoutesConstants.initialRoute,
    );
  }
}
