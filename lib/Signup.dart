// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'newsUi.dart';


class loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return loginpagestate();
  }

}
class loginpagestate extends State<loginpage>{

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  bool isloading = false;
  readfromstorage() async {
    //get
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.get('email');
    var password = prefs.get("password");
    if(email==null){// stay idle
    }else{
      setState(() {
        emailcontroller.text = email.toString();
        passwordcontroller.text = password.toString();
        //loading
        isloading = true;
      });
      // login sucess //go to detail page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            NewsUi()),
      );
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readfromstorage();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon or image
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3Lmq1cpBUiRrf3mCH5Pr4EMg44o3jRRnPSZgFL0XDWSZkSu9Ofn0zHvG52JHNE-gSoAE&usqp=CAU"
              ,height: 100,width: 150,fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: const Color(0xfffbaf43),
                  borderRadius: BorderRadius.circular(30)
              ),
              height: size.height/3,
              width: size.width/1.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Sign in",style: TextStyle(fontSize: 18,color: Colors.black),),
                  ),

                  Container(height: 45,width: size.width/1.5,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    )
                    ,child: Center(child: TextField(
                      controller: emailcontroller
                      , )),),

                  Container(height: 45,width: size.width/1.5,
                    margin: EdgeInsets.only(top: 15,bottom: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    )
                    ,child: Center(child: TextField(
                      controller: passwordcontroller,
                      obscureText: true,)),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if(emailcontroller.text.contains("@")
                              && passwordcontroller.text.isNotEmpty){
                            //shared pref part
                            //store key val
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('email', emailcontroller.text);
                            prefs.setString('password', passwordcontroller.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  NewsUi()),
                            );
                          }else{
                            //show error

                          }
                        },
                        child:
                        isloading==true?Container(
                          child: CircularProgressIndicator(),
                        ):Container(
                          height: 50,width: 150,
                          decoration: BoxDecoration(color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text("Login".toUpperCase(),
                              style: TextStyle(color: Colors.white,
                                  fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            )
            //container
          ],
        ),
      ),
    );
  }

}