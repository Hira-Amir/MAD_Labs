import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCardWidget(),
    );
  }
}

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({Key? key}): super(key: key
  );

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  double firstscale = 1.0;
  double secondscale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: GestureDetector(
            onScaleStart: (details) {
              firstscale = secondscale;
            },
            onScaleUpdate: (details) {
              setState(() {
                secondscale = firstscale * details.scale;
              });
            },
            child: Transform.scale(
              scale: secondscale,
              child: Center(child: Container(height: 100,width: 100,color: Colors.blueAccent,))
            )));
  }
}
