 import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/newsapi.dart';

class Cardsandmodels{
  String formatDateTimestring(String date){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
  }
  static verticalcarditem(var size, Articles article){
    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: 10,right: 10,top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //stack
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(article.urlToImage!,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  const Positioned(left: 110,top: 70,child:
                  Icon(Icons.play_circle,color: Colors.white,size: 30,))
                ],
              )
            ],
          ),
          // text
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width/2.5,
                child:  Text(article.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 14,
                      color: Colors.black
                  ),maxLines: 2,),
              ),
              //row
              // button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:  Text(article.author!,
                      style: TextStyle(color: Colors.white,fontSize: 10),),
                  ),
                  Container(
                    width: 100,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(formatDateTimestring(article.publishedAt!),
                        style: TextStyle(color: Colors.black54,fontSize: 12),),
                    ),
                  )
                ],
              )
              // tex


            ],
          )
        ],
      ),
    );
  }
 }
