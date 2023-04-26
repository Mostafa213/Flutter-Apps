import 'dart:math';

import 'package:flutter/material.dart';
void main()=>runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my app',
        theme: ThemeData(
          primarySwatch:Colors.blue,
        ),
        home: MyHomePage(title:'my app'),
    );
  }

}

class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key? key, required this.title}):super(key: key);
  
  @override
  _MyHomePageState createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  int counter=1;
  void _incrementCounter() {
    setState(() {
      var rand=Random();
        counter=rand.nextInt(13);
        print("$counter");
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarOpacity: .6,
        leading: CircleAvatar(backgroundImage: AssetImage("assets/Logo.jfif"),),

      ),
      body: Column(
        children:<Widget> [
          Center(child: Image(image:AssetImage("assets/$counter.jpg")),),
          //Image(image:AssetImage("assets/Logo.jfif")),
          Text("صفي النية يخول"),

        ],
        
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      floatingActionButton: FloatingActionButton(onPressed: (){
        _incrementCounter();
      }),
    );
  }
}