import 'package:flutter/material.dart';

import 'package:transiciones_app/src/pages/page_two.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Página 1"),
      ),
      body: Center(child: Text("Pagina #1")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chevron_right),
        onPressed: () {
          Navigator.push(context, _navigateRoute());
        },
      ),
    );
  }

  Route _navigateRoute() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            PageTwo(),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          // return SlideTransition(
          //   child: child,
          //   position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
          //       .animate(curveAnimation),
          // );

          //   return ScaleTransition(
          //       child: child,
          //       scale:
          //           Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation));

          return RotationTransition(
              child: child,
              turns:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation));
        });
  }
}
