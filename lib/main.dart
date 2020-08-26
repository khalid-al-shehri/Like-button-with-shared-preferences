import 'dart:convert';

import 'package:flutter/material.dart';
import 'SPmethods.dart';
import 'icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Like Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Like Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   var SPmethods = sharedPreferences();

  List Items = [
    {
      'id':1,
      'name':'Khalid',
      'age': 25,
      'isLike':false,
    },
    {
      'id':2,
      'name':'Ali',
      'age': 22,
      'isLike':false,
    },
    {
      'id':3,
      'name':'Mohammed',
      'age': 33,
      'isLike':false,
    },
    {
      'id':4,
      'name':'Hassan',
      'age': 12,
      'isLike':false,
    },
    {
      'id':5,
      'name':'Azam',
      'age': 43,
      'isLike':false,
    },
    {
      'id':6,
      'name':'Saad',
      'age': 23,
      'isLike':false,
    }
  ];

  checkOfSavedList() async{

    bool isSavedList = await SPmethods.check('items');
    String SavedList = null;

    if(isSavedList == true){

      SavedList = await SPmethods.getStringValuesSF('items');

      setState(() {
        Items = json.decode(SavedList);
      });
    }

    print(isSavedList);

  }

  like(int id){
    List.generate(Items.length, (index){
      if(id == Items[index]['id']){
        setState(() {
          Items[index]['isLike'] = !Items[index]['isLike'];
        });
      }
    });

    SPmethods.addStringToSF('items', json.encode(Items));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkOfSavedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.10),
        ),
        child: ListView.builder(
            itemCount: Items.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Name : "+Items[index]['name']),
                    Text("Age : "+Items[index]['age'].toString()),
                    IconButton(
                        icon: Icon(
                            Items[index]['isLike'] == false ? likeIcons.thumbs_up : likeIcons.thumbs_up_alt
                        ),
                        onPressed: (){
                          like(Items[index]['id']);
                        }
                    ),
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}
