import 'package:flutter/material.dart';
import 'DetailScreen.dart';

class HomeScreen extends StatelessWidget
{

  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
        appBar: AppBar(title: Text(title)),

        body: Center( child: ElevatedButton( onPressed: () {Navigator.of(context).push(_createRoute());}, child: const Text('Go to Detail'),),),
    );
  }

  PageRouteBuilder _createRoute()
  {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const DetailScreen(title: "Welcome to Detail Screen"),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

}
