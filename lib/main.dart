import 'package:flutter/material.dart';
import 'DynamicRoutesScreen.dart'; // Pastikan mengimpor DynamicRoutesScreen
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'fourth_screen.dart';
import 'erorHandling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second_screen': (context) => SecondScreen(),
        '/third_screen': (context) => ThirdScreen(),
        '/fourth_screen': (context) => FourthScreen(),
        '/dynamic_routes_screen': (context) => DynamicScreen(
            routeNumber: 0,
            numberOfScreens: 0), // Gantilah dengan nilai yang sesuai
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/dynamic_screen_')) {
          int routeNumber = int.tryParse(settings.name!.split('_')[2]) ?? 0;
          return MaterialPageRoute(
            builder: (context) {
              // Pastikan Anda menggunakan nama yang benar untuk widget DynamicRoutesScreen
              return DynamicScreen(
                  routeNumber: 0,
                  numberOfScreens: 0); // Sesuaikan dengan widget yang benar
            },
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => erorHandling(),
          settings: settings,
        );
      },
    );
  }
}
