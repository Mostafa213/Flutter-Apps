// import 'dart:html';
// import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:popup_menu/popup_menu.dart';
import 'package:popup_card/popup_card.dart';
void main()=>runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pooop up',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: First_Panel(title:'1ST Panel'),
    );
  }
}

class First_Panel extends StatefulWidget{
  final String title;
  First_Panel({Key? key, required this.title}):super(key: key);
  @override
  _final_panel createState()=>_final_panel();
}

class _final_panel extends State<First_Panel>{
  


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () => changeURL(context), 
          icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(children:<Widget> [
        Center(child: Text('anything')),
      ],
      ),
      floatingActionButton: PopupItemLauncher(
        tag: 'test',
        // ignore: sort_child_properties_last
        child: Material(
          color: Colors.indigoAccent,
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.add_rounded,
            size: 50,
          ),
        ),
        popUp: PopUpItem(
          padding: EdgeInsets.all(8),
          color: Colors.greenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 2,
          tag: 'test',
          child: PopUpItemBody(),
        ),
      ),
    );
  }


  ///////////////////////////////////////////////////////////
  
  var imgURL,pdfURL;
  changeURL(BuildContext context){  /////////Added successfuly////not used yet 4.40
  return showDialog(
    barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
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
                      
                      onChanged: (value){
                        if(value != null && value != ""){
                          this.imgURL=value;
                        }
                          // this.
                      },
                      // onSubmitted: (input) =>type = input,

                    ),
                SizedBox(height: 2.0),
                    TextField(
                      decoration: InputDecoration(hintText: "PDF URL"),
                      
                      onChanged: (value){
                        if(value != null && value != ""){
                        this.pdfURL=value;  
                        }
                      },
                      // onSubmitted: (input) =>type = input,

                    ),
               ],
             ),
           ),
            actions: <Widget>[
              TextButton(
                child: new Text('Submit'),
                // textColor: Colors.blue,
                onPressed: () {
                  print(imgURL);
                  print(pdfURL);
                  setState(() {
                    this.imgURL;
                    this.pdfURL;
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
      }
  );
}
}

///////////////////////////////////////////////////////////////////////

class PopUpItemBody extends StatelessWidget {
  const PopUpItemBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController input1=new TextEditingController();
    TextEditingController input2=new TextEditingController();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: input2,
            decoration: InputDecoration(
              hintText: 'New todo',
              border: InputBorder.none,
            ),
            cursorColor: Colors.indigo,
          ),
          // const Divider(
          //   color: Colors.indigo,
          //   thickness: 0.2,
          // ),
          TextField(
            controller: input1,
            decoration: InputDecoration(
              hintText: 'Write a note',
              border: InputBorder.none,
            ),
            cursorColor: Colors.indigo,
            maxLines: 6,
          ),
          // const Divider(
          //   color: Colors.indigo,
          //   thickness: 0.2,
          // ),
          TextButton(
            onPressed: () {
              print(input1.text+input2.text);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}


