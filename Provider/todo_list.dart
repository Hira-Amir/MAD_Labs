import 'package:api/models/todo.dart';
import 'package:api/todo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
class Home extends StatefulWidget{
  @override
  State<Home> createState() => _homestate();

}
class _homestate extends State<Home>{
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(length: 2, child: Scaffold(
   appBar: AppBar(
    title: const Text('Todo List'),
    bottom: TabBar(tabs: [
      Tab(child: const Text('List View'),),
       Tab(child: const Text('Grid View'),)
    ],),

   ),
   body: Center(child: TabBarView(children: [
     ListView.builder(
        itemCount: context.watch<todoNotifier>().getTodos.length,
        itemBuilder: (context,index) {
             Todo todoo =context.watch<todoNotifier>().getTodos[index];
          return ListTile(
           leading: Checkbox(value:todoo.isDone,
           onChanged: (value){
            context.read<todoNotifier>().toggleIsDone(index);
           
           },),
           title:  Text(todoo.title),
           subtitle: Text(todoo.subt),
           trailing: IconButton(onPressed: (){

            context.read<todoNotifier>().removeTodo(index);

           },icon: Icon(Icons.delete),),
          );

        }

      ),
       GridView.builder(
        itemCount: context.watch<todoNotifier>().getTodos.length,
        itemBuilder: (context,index) {
             Todo todoo =context.watch<todoNotifier>().getTodos[index];
          return Card(
            color: const Color.fromARGB(255, 241, 194, 210),
           child:ListTile(
            
           title:  Text(todoo.title),
           subtitle: Text(todoo.subt),
           leading: Checkbox(value:todoo.isDone,
           onChanged: (value){
            context.read<todoNotifier>().toggleIsDone(index);
           
           },),
           trailing: IconButton(onPressed: (){

            context.read<todoNotifier>().removeTodo(index);

           },icon: Icon(Icons.delete),),
           ) );

        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

      ),
   ],),)
   ));
  }
  
}