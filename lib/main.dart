import 'package:demo1/detailpage.dart';
import 'package:demo1/newsUi.dart';
import 'package:flutter/material.dart';


import 'Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NewsUi(),
    );
  }
}

class firstclass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return firstclassState();
  }

}

class firstclassState extends State<firstclass>{
  textcard(String txt){
    return  Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.only(left: 8,right: 8),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(txt,style: const TextStyle(color: Colors.white),)),
    );
  }

  horizontalcard(){
    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),

      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),

                    ),
                    child: Image.network("data:image/jpeg;base64,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",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:Colors.grey,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Icon(Icons.fastfood_sharp, size: 30,)),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("Burger with fries",
                  style : TextStyle(color: Colors.black,
                      fontSize: 30, fontWeight: FontWeight.normal),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Rs. 499", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
              ),
              Row(
                children: [
                  Icon (Icons.star),
                  Icon (Icons.star),
                  Icon (Icons.star),
                  Icon (Icons.star),
                  Icon (Icons.star_border),
                ],
              )
            ],
          ),
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black12,
                child: Column(
                  children: [
                    const SizedBox(height:20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: size.width/1.1,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Row(
                            children:  const [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0,right: 15.0),
                                child: Icon(Icons.search,color: Colors.white,size: 18,),
                              ),
                              Text("Search Here...",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height:20),
                    Container(

                      child: Row(
                        children: [
                          textcard("lab1"),
                          textcard("lab2"),
                          textcard("lab3"),
                          textcard("lab1"),
                          textcard("lab2"),
                          textcard("lab3")
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Food Home Delivery",
                          style : TextStyle(color: Colors.black,
                              fontSize: 20, fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Icon (Icons.star),
                            Icon (Icons.star),
                            Icon (Icons.star),
                            Icon (Icons.star),
                            Icon (Icons.star),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text("Rs. 499", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Text("Details",
                  style : TextStyle(color: Colors.black,
                      fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text("asdfghjkloiuytrewqazxcvbnmkliuytrfdswertyuikjhcdrtyuikjhgfdtyuijhgfdyu",
                  style : TextStyle(color: Colors.black,
                      fontSize: 20, fontWeight: FontWeight.normal),),


              ),

              //se
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Text("Location",
                  style : TextStyle(color: Colors.black,
                      fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text("asdfghjkloiuytrewqazxcvbnmkliuytrfdswertyuikjhcdrtyuikjhgfdtyuijhgfdyu",
                  style : TextStyle(color: Colors.black,
                      fontSize: 20, fontWeight: FontWeight.normal),),


              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Text("Phone",
                  style : TextStyle(color: Colors.black,
                      fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text("asdfghjkloiuytrewqazxcvbnmkliuytrfdswertyuikjhcdrtyuikjhgfdtyuijhgfdyu",
                  style : TextStyle(color: Colors.black,
                      fontSize: 20, fontWeight: FontWeight.normal),),


              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Text("Website",
                  style : TextStyle(color: Colors.black,
                      fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text("asdfghjkloiuytrewqazxcvbnmkliuytrfdswertyuikjhcdrtyuikjhgfdtyuijhgfdyu",
                  style : TextStyle(color: Colors.black,
                      fontSize: 20, fontWeight: FontWeight.normal),),


              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    horizontalcard(),
                    horizontalcard(),
                    horizontalcard(),
                    horizontalcard(),
                    horizontalcard(),
                    horizontalcard(),
                    horizontalcard(),


                  ],
                ),
              )
            ],
          ),
        ),
      ),


    );
  }

}