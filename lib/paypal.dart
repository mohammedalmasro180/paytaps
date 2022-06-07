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
                IconButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UsePaypal(
                              sandboxMode: true,
                              clientId:
                              "ATAkHcIVzLV8hisvZ5hiqTDTWyxCEeaOlwou9TZp8FJHDLidueL4p0NEhzvxlaAiJFLQBKIbmdKKyK50",
                              secretKey:
                              "EBGVeJG_Qc5Cl9ehHbbo_t2I1ccM0yqFrh4lf4sgyzKqLCp9zHhHzFywxoFrPlh0euvgkwxByHCMfTvz",
                              returnURL: "https://samplesite.com/return",
                              cancelURL: "https://samplesite.com/cancel",
                              transactions: const [
                                {
                                  "amount": {
                                    "total": '1.12',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '1.12',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description":
                                  "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "A demo product",
                                        "quantity": 1,
                                        "price": '1.12',
                                        "currency": "USD"
                                      }
                                    ],

                                    // shipping address is not required though
                                    "shipping_address": {
                                      "recipient_name": "Jane Foster",
                                      "line1": "Travis County",
                                      "line2": "",
                                      "city": "Austin",
                                      "country_code": "US",
                                      "postal_code": "73301",
                                      "phone": "+00000000",
                                      "state": "Texas"
                                    },
                                  }
                                }
                              ],
                              note: "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => MySample()


                                ));
                save();                },
                              onError: (error) {
                                print("onError: $error");
                              },
                              onCancel: (params) {
                                print('cancelled: $params');
                              }),
                        ),
                      )
                    },
                    icon: Image.asset("img/paypal_logo.jpg",),
                  iconSize: 300,


                ),





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