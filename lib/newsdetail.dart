import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Model/newsapi.dart';
import 'api/Getapi.dart';

class Newsdetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsdetailState();
  }
}

class NewsdetailState extends State<Newsdetail> {
  late Future<Newsapi?>? _futureverticallist;
  apicallv(){
    _futureverticallist = GetApi.getnewsdata();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top part
            // stack //image //icon //back button
            //text title, author, date and description
            Stack(
              children: [
                SizedBox(
                  height: 60,
                ),
                Image.network(
                  "",
                  height: size.height / 5.5,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 15,
                    left: 20,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ))),
                Positioned(
                    top: 15,
                    right: 20,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    )),
                Container(
                    height: size.height / 3.5,
                    width: size.width,
                    child: Center(
                        child: Icon(
                          Icons.play_circle,
                          color: Colors.white,
                          size: 50,
                        )))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width / 1.5,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "PCPS news title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("author", style: TextStyle(color: Colors.black,fontSize: 14, fontWeight: FontWeight.normal,),),
                  Text(cardsandmodels.formatDateTimestring(""), style: TextStyle(color: Colors.black,
                    fontSize: 14, fontWeight: FontWeight.normal,),),
                ],
              ),
            ),

            //description
            Container(
              width: size.width / 1.2,
              padding: EdgeInsets.only(bottom: 20, top: 15),
              child: Text(
                "PCPS news title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            //divider
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.black, height: 10, thickness: 0.5,
              ),
            ),


            //bottom part
            //vertical list card
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
                              return Cardsandmodules.verticalcarditem(size,snapshot.data!.articles![index]);
                            },
                          ),
                        );
                      }
                    default: //error
                      return Container(); //error paxi thapamla
                  }
                }
            ),

          ],
        ));
  }
}