import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

pushPageWithReplaceLeft(BuildContext context, var page) {
  Navigator.pushReplacement(context, routeLeft(page));
}

pushPageWithReplaceUp(BuildContext context, var page) {
  Navigator.pushReplacement(context, routeUp(page));
}

pushPageLeft(BuildContext context, var page) {
  Navigator.push(context, routeLeft(page));
}

pushPageUp(BuildContext context, var page) {
  Navigator.push(context, routeUp(page));
}

pushPageRight(BuildContext context, var page) {
  Navigator.push(context, routeRight(page));
}

///************************************************************* *///

Route routeUp(
  var page,
) {
  return PageRouteBuilder(
      pageBuilder: (context, a1, a2) => page,
      transitionsBuilder: (context, a1, a2, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end);

        var curvedAnimation = CurvedAnimation(
          parent: a1,
          curve: curve,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

Route routeLeft(
  var page,
) {
  return PageRouteBuilder(
      pageBuilder: (context, a1, a2) => page,
      transitionsBuilder: (context, a1, a2, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end);

        var curvedAnimation = CurvedAnimation(
          parent: a1,
          curve: curve,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

Route routeRight(
  var page,
) {
  return PageRouteBuilder(
      pageBuilder: (context, a1, a2) => page,
      transitionsBuilder: (context, a1, a2, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end);

        var curvedAnimation = CurvedAnimation(
          parent: a1,
          curve: curve,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}
