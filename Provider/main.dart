import 'dart:html';

import 'package:api/colors.dart';
import 'package:api/todo_list.dart';
import 'package:api/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/todo.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return todoNotifier();
      },
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: primary),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tt = TextEditingController();
  TextEditingController st = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newtask;

    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 94,
              ),
             
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 150,
                width: 400,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    TextFormField(
                        controller: tt,
                        decoration: const InputDecoration(
                          label: Text("Title"),
                        )),
                    TextFormField(
                        controller: st,
                        decoration: const InputDecoration(
                          label: Text("Description"),
                        )),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          context.read<todoNotifier>().addTodos(Todo(
                              title: tt.text, subt: st.text, isDone: false));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                        child: const Text('Add')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
