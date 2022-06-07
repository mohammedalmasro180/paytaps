import 'package:educational_mostaql/Mypublic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:educational_mostaql/main.dart';
import 'package:educational_mostaql/paytaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';


class MyPal extends StatefulWidget {
  const MyPal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyPal> createState() => _MyPalState();
}

class _MyPalState extends State<MyPal> {
  @override
  //paypal_logo.jpg

  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,


      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor:  Colors.black,
          ),
          body: Center(
            child: ListView(

              children: [
                Text("اشتري التطبيق عبر الوسائل التالية",style: TextStyle(fontSize: 25),),
                paytaps(),




              ],
            ),
          )),
    );
  }
}
removeperf()async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.remove("username");

}

save() async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("username", "pppppp");
  print(sharedPreferences.get("username"));

}