import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black87,
                onPressed: (){
                  print('Menu');
                },
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('SekolahKU', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                ],
            ),

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                color: Colors.black87,
                onPressed: (){
                  print('Prefences');
                },
              ),
            ],

            backgroundColor: Colors.white,
          ),
          body: Tiles(),
        ),
      );
  }
}

class Tiles extends StatelessWidget {
  List<String> events = [
    "Tugasku",
    "Berkasku",
    "Karyaku",
    "Pesanku"
  ];
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      color: Colors.black,
      child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black87, width: 2.0),
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/antonie.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                "I Gusti Anton Surya Diputra",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                "Student",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black45
                ),
              ),
              MaterialButton(
                onPressed: () {print('This app Premium 😎');},
                //padding: EdgeInsets.all(10.0),
                minWidth: 1.0,
                height: 22,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                color: Colors.black87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 10,
                    ),
                    Text(
                      'Premium',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 220.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              margin: EdgeInsets.only(top: 205.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: events.map((title) {
                    return GestureDetector(
                      child: Card(
                        margin: const EdgeInsets.all(20.0),
                        child: getCardByTitle(title),
                        ),
                        onTap: (){
                        Fluttertoast.showToast(
                        msg: title + "click",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                        );
                    },);
                  }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

  Column getCardByTitle(String title) {
     String img = "";
     if(title == "Tugasku")
       img = "assets/clipboard.png";
     else if(title == "Berkasku")
       img = "assets/folder.png";
     else if(title == "Karyaku")
       img = "assets/artist.png";
     else if(title == "Pesanku")
       img = "assets/chat.png";

     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         new Center(
           child: Container(
              child: new Stack(children: <Widget>[
                new Image.asset(
                  img,
                  width: 30.0,
                  height: 30.0,
                ),
              ],
              )),
         ),
         SizedBox(height: 8.0),
         Text(
             title,
             style:TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
       ],
     );
  }
}

