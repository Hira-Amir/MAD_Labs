import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ImageZoomScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageZoomScreen extends StatefulWidget {
  @override
  _ImageZoomScreenState createState() => _ImageZoomScreenState();
}

class _ImageZoomScreenState extends State<ImageZoomScreen> {
  double zoomLevel = 1.0;
  String currentImage = 'images/Hira.jpeg';

  void _zoomIn() {
    setState(() {
      zoomLevel += 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      zoomLevel -= 0.1;
    });
  }

  void _updatePicture() {
    setState(() {
      currentImage = 'images/Hina.jpeg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _updatePicture,
              child: Transform.scale(
                scale: zoomLevel,
                child: Image.asset(
                  currentImage,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _zoomIn,
                  child: const Text('Zoom In'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _zoomOut,
                  child: const Text('Zoom Out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}