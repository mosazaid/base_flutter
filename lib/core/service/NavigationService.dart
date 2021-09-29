import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
  new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName,{Object arguments}) {
    return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,{Object arguments}) {
    return navigatorKey.currentState.pushReplacementNamed(routeName,arguments: arguments);
  }


  Future<dynamic> pushNamedAndRemoveUntil(String routeName) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName,(asd)=>false);
  }
}