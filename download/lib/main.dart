import 'package:download/result.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:alert/alert.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'my app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarOpacity: .6,
        // leading: CircleAvatar(backgroundImage: AssetImage("assets/Logo.jfif"),),
        actions: [
          IconButton(
            onPressed: () async {
              response != null
                  ? await Clipboard.setData(
                      ClipboardData(text: "$response.data"))
                  : Alert(message: 'error').show();
              print('cheak it bro');
              Alert(message: 'copied sucssesfuly').show();
              // copied successfully
            },
            icon: Icon(Icons.copy),
          ),
          IconButton(
            onPressed: () => changeURL(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                '$imgURL',
                selectionColor: Colors.amber,
              ),
            ),
            response != null ? Text(str) : Text('nothing yet'),
            response != null ? TextButton(onPressed: (){ 
              Navigator.push(context,MaterialPageRoute(builder: (context)=>result(linList)));
            },
            child: Text('show')):Text(''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getHttp();
          update();
        },
        child: const Icon(Icons.download),
      ),
      
      // floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   // _incrementCounter();
      // }),
    );
  }

  // var dio = Dio();
  void update() {
    setState(() {
      response;
      str = '';
      linList=[];
      // var e = 'shit.png';
      // var h = e.split('.png');
      // print(h.length==2?'1':'0');
      // int g=h.length;
      // print('lenth = $g');
      try {
        var s = response.data.toString().split("\<img");
        
        for (int i = 1; s[i] != null; i++) {
          var x = s[i].split('src=\"');
          var ne = x[1].split('\"');
          str += ne[0];
          int k=ne[0].split('.js').length;
          print('the value is : $k');
          if(k!=2){
            linList.add(ne[0]);
          }
          
        }
      } catch (e) {
        print(e);
      }
    });
  }

  var response;
  var str = '';
  var linList=[];
  void getHttp() async {
    try {
      response = await Dio().get('$imgURL',options: Options(followRedirects: false,validateStatus: (status) => true,));
      var string = response.data.toString();
      var li = string.split('\<img');
      print(li[5].split('\"')[3]);
      // print(spli);
      update();
    } catch (e) {
      print(e);
    }
  }

  //////////////////////////////
  var imgURL = 'http://www.google.com';
  changeURL(BuildContext context) {
    /////////Added successfuly////not used yet 4.40
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            // ignore: unnecessary_new
            child: new AlertDialog(
              //title: new Text('Done', style: TextStyle(fontSize: 15.0),),
              /// content: Text('Added'),

              content: Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 2.0),
                    TextField(
                      decoration: InputDecoration(hintText: "Image URL"),

                      onChanged: (value) {
                        if (value != null && value != "") {
                          this.imgURL = value;
                        }
                        // this.
                      },
                      // onSubmitted: (input) =>type = input,
                    ),
                    // SizedBox(height: 2.0),
                    //     TextField(
                    //       decoration: InputDecoration(hintText: "PDF URL"),

                    //       onChanged: (value){
                    //         if(value != null && value != ""){
                    //         this.pdfURL=value;
                    //         }
                    //       },
                    //       // onSubmitted: (input) =>type = input,

                    //     ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: new Text('Submit'),
                  // textColor: Colors.blue,
                  onPressed: () {
                    print(imgURL);
                    //print(pdfURL);
                    setState(() {
                      this.imgURL;
                      // this.pdfURL;
                    });
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: new Text('Exit'),
                  // textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          );
        });
  }
}
