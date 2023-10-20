import 'package:demo1/models/cardsandmodels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Model/newsapi.dart';
import 'api/Getapi.dart';








class NewsUi extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return NewsUiState();
  }
}

class NewsUiState extends State<NewsUi>{
  late Future<Newsapi?>? _futurehorizontallist;
  late Future<Newsapi?>? _futureverticallist;



  horizontalCard(var size, Articles articles){
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Stack(
          children:[
            Container(
              height: size.height/4,
              width: size.width/1.5,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(articles.urlToImage!,
                  fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              left: 15,
              bottom: 70,
              child: Container(
                  width: size.width/1.5,
                  child: Text(articles.title!, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
            ),
            Positioned(bottom:10, left:15, child: Text(Cardsandmodels.formatDateTimestring(articles.publishedAt!))),
            Positioned(right:10, bottom:10, child: Icon(Icons.play_circle, size:30,))
          ]
      ),
    );
  }
  horizontallistitem(size, Articles article){
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Container(
            width: size.width/1.7,
            height: size.height/4.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(article.urlToImage!,
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 65,
            left: 20,
            child: Container(
              width: size.width/1.9,
              child: Text(article.title!.toUpperCase()
                ,maxLines: 2,overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontSize: 16,
                    fontWeight:FontWeight.bold),),
            ),
          ),
          Positioned(
            left: 20,bottom: 5,
            child: Text(formatDateTimestring(article.publishedAt!),style: TextStyle(color: Colors.white,
              fontSize: 14,fontWeight: FontWeight.normal,),),
          ),
          Positioned(bottom: 5,right: 15,child: Icon(Icons.play_circle,color: Colors.white,size: 25,))
        ],
      ),
    );
  }
  verticalCard(var size, Articles articles){
    return  Container(
      child: Row(
        children: [
          //stack column
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(articles.urlToImage!,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(left: 85, top: 60, child:
                  Icon(Icons.play_circle, color: Colors.black, size: 30,),)
                ],
              ),
              //text
            ],
          ),

          Column(
            children: [
              Container(
                width: size.width/2,
                child: Text(articles.title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),maxLines: 2,),
              ),
              //button

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top:15, bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(articles.author!,
                      style: TextStyle(color: Colors.white, fontSize: 10),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(formatDateTimestring(articles.publishedAt!),
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          ),

          //column
          //text
          // row //container //text //date //icon
        ],
      ),
    );
  }


  apicallh(){
    _futurehorizontallist = GetApi.getnewsdata();
  }
  apicallv(){
    _futureverticallist = GetApi.getnewsdata();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallh();
    apicallv();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        body: Column(
            children: [
              //horizontal list
              FutureBuilder<Newsapi?>(
                  future: _futurehorizontallist, //a previously obtained Future<String>
                  builder: (BuildContext context, AsyncSnapshot<Newsapi?>snapshot){
                    //switch
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      //error
                        return Container(); //paxi dialog box thapne
                      case ConnectionState.waiting: //loading
                        return Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if(snapshot.data==null || snapshot.data!.articles!.isEmpty){
                          return Center(
                            child: Container(
                              child: Text("No data or api issue"),
                            ),
                          );
                        }
                        else{
                          //data aayo
                          //show ui

                          return Container(
                            height: size.height/4,
                            width: size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.articles!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return horizontallistitem(size, snapshot.data!.articles![index]);
                              },
                            ),
                          );
                        }
                      default: //error
                        return Container(); //error paxi thapamla
                    }
                  }
              ),

              FutureBuilder<Newsapi?>(
                  future: _futureverticallist, //a previously obtained Future<String>
                  builder: (BuildContext context, AsyncSnapshot<Newsapi?>snapshot){
                    //switch
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      //error
                        return Container(); //paxi dialog box thapne
                      case ConnectionState.waiting: //loading
                        return Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if(snapshot.data==null || snapshot.data!.articles!.isEmpty){
                          return Center(
                            child: Container(
                              child: Text("No data or api issue"),
                            ),
                          );
                        }
                        else{
                          //data aayo
                          //show ui

                          return Container(
                            height: size.height/1.5,
                            width: size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data!.articles!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Cardsandmodels.verticalcarditem(size,snapshot.data!.articles![index]);
                              },
                            ),
                          );
                        }
                      default: //error
                        return Container(); //error paxi thapamla
                    }
                  }
              ),




            ])
    );
  }

}