import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget
{
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text(title),),
      body: Center(child: ElevatedButton(onPressed: () { Navigator.of(context).pop();}, child: const Text('Back to Home'),),),
    );
  }
}
