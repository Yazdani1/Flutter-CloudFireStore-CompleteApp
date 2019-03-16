import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DetailsPage.dart';
import 'package:async/async.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

//  Future _data;

  Future getPosts() async{

    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("posts").getDocuments();
    return qn.documents;
  }

  navigatTodetail(DocumentSnapshot post){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>DetailsPage(post: post)));
  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _data=getPosts();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("FireStore List Data App"),
        backgroundColor: Colors.purple,
      ),


      body: new FutureBuilder(
        future: getPosts(),
          builder: (_,snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text("Loading.."),
          );
        }else{
          return ListView.builder(
            itemCount: snapshot.data.length,
              itemBuilder: (_,index){

              return Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,

                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),


                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      new InkWell(
                        onTap: (){
                          navigatTodetail(snapshot.data[index]);
                        },
                        child:Text(
                          snapshot.data[index].data["title"],
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      new Padding(padding: EdgeInsets.all(5.0)),
                      new Text(snapshot.data[index].data["content"]),

                    ],
                  ),
                ),
              );
              }
          );
        }

      }),


    );
  }
}
