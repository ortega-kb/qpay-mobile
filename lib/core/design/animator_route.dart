import 'package:flutter/material.dart';

Route animateRoute(Widget route) {
  return MaterialPageRoute(
    builder: (context) {
      return route;
    },
  );
}

//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.linear;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
