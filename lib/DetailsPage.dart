import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatefulWidget {

  final DocumentSnapshot post;

  DetailsPage({this.post});


  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Details Page"),
        backgroundColor: Colors.orange,
      ),
    
      body: new Container(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(10.0),
          child:new Padding(padding: EdgeInsets.all(10.0),

            child:new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              new Text(widget.post.data["title"],style: TextStyle(fontSize: 45.0),),
              new SizedBox(height: 10.0,),
              new Text(widget.post.data["content"]),

            ],
          ),

          )

        ),
      ),

    );
  }
}
