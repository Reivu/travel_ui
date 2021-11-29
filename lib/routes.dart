import 'package:flutter/material.dart';
import 'package:flutter_state/models/destination_model.dart';
import 'package:flutter_state/screens/destination_screen.dart';
import 'package:flutter_state/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/destinations':
        if (args is Destination) {
          return MaterialPageRoute(
            builder: (_) => DestinationScreen(destination: args),
          );
        }
        return _error();
      default:
        return _error();
    }
  }

  //Error
  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('ERROR!'),
        ),
      ),
    );
  }
}
