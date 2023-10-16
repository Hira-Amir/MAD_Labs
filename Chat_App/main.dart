import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My chatApp',
        theme: ThemeData(primarySwatch: Colors.brown),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime Time = DateTime.now();
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('do you wnat to send a new message'),
                  duration: Duration(microseconds: 1000000000),
                ));
              },
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            appBar: AppBar(
              title: const Text('ChatApp',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w400)),
              actions: [
                SizedBox(
                  width: 20,
                ),
                const Icon(Icons.search),
                PopupMenuButton<int>(
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                              child: Text('New Group'), value: 1),
                          const PopupMenuItem(
                              child: Text('Starred Messages'), value: 4),
                          const PopupMenuItem(child: Text('setting'), value: 5),
                        ])
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('Chats'),
                ),
                Tab(
                  child: const Text('Status'),
                ),
              ]),
            ),
            body: Center(
              child: TabBarView(
                children: [
                  
                  ListView(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Hira'),
                          subtitle: Text('Hi, How are u doing??'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1623091411395-09e79fdbfcf3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kaWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                          ),
                          trailing: Text('$Time'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Amber'),
                          subtitle: Text('Very nice weather!!'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1623091411395-09e79fdbfcf3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kaWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                          ),
                          trailing: Text('$Time'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: Center(
                    child: Text('No Status Updates'),
                  ))
                ],
              ),
            )));
  }
}
