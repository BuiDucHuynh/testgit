import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late List dummyList;
  ScrollController _scrollController = ScrollController();
  int _currentMax =20;
 @override
  void initState() {
    // TODO: implement initState
   dummyList = List.generate(_currentMax, (index) => "Item: ${index + 1}");
   _scrollController.addListener(() {
     if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
       _getMoreData();
     }
   });
   super.initState();
  }
  _getMoreData(){
   print("get more");
   for(int i=_currentMax; i<_currentMax +20; i++){
     dummyList.add("Iteam: ${i + 1}");
   }

   _currentMax = _currentMax + 20;
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        controller:  _scrollController,
          itemExtent: 60,
          itemCount: dummyList.length +1,
          itemBuilder: (context, index) {
          if(index == dummyList.length){
            return CupertinoActivityIndicator();
          }
            return ListTile(
              title: Text(dummyList[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

///commit
