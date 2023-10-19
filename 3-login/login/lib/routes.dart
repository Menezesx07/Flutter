import 'package:go_router/go_router.dart';
import 'package:login/telas/home.dart';
import 'package:login/telas/login.dart';

final routes = GoRouter(routes: [

  GoRoute(
    path: '/',
    builder: (context, state) => LoginPage(),
  ),

  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),


]);