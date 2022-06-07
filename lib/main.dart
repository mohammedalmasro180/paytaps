import 'dart:core';

import 'package:educational_mostaql/Mypublic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:educational_mostaql/paypal.dart';
import 'package:educational_mostaql/paytaps.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// @dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
      splashIconSize: 666,
      duration: 3000,
      splash: Image.asset("img/lg.png",),
      nextScreen: MyHomePage(),
      splashTransition: SplashTransition.fadeTransition,
      //pageTransitionType: PageTransitionType.scale,




    )
    );
  }
}


class MySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
Mypublic myb=new Mypublic();
Future<bool> chkpay() async {
  SharedPreferences preferences=await SharedPreferences.getInstance();
  return preferences.getString("username")!= null;
}

late   bool paed;

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    chkpay();

    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {



    Future getdata() async{

      Uri uri = Uri.parse("https://tpowep.com/edu/api.php");

      http.Response response = await http.get(uri);
      String jsonsDataString = response.body.toString();
      var    _data = jsonDecode(jsonsDataString);
      print(_data);
      paed=await chkpay();
print("?"+paed.toString());
      return _data;

    }

//print("======="+paed.toString());

getdata();
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("تعلم معنا",style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) =>MyPal(title: "شراء التطبيق")


                  ));


                },
                child: Column(
                  children: [
                    Text(" شراء التطبيق",style: TextStyle(fontSize: 14),),
                    Text(" 5\$",style: TextStyle(fontSize: 14),),

                  ],
                )

            ),
          ),

        ],
      ),
      body: FutureBuilder(

          future: getdata(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {

          int i=0;
              if(paed==true) {
                i = snapshot.data.length;
              print(paed);
              }

            else
              {
                print(paed);

                i=3;
              }
//              i=3;
              return ListView.builder(


                  itemCount:i,


                  itemBuilder: (context,i) {
                    return
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Ditalis(
                            addres:  snapshot.data[i]['address'].toString(),
                            vedio:  snapshot.data[i]['link'].toString(),
                            txt:  snapshot.data[i]['text'].toString(),
                            img:  snapshot.data[i]['img'].toString(),

                          )));




                        },

                        child:Card(
                          child: ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        "https://tpowep.com/edu/" +
                                            snapshot.data[i]['img'],
                                        width: 150,
                                        height: 150,

                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[i]['address'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),),
                                    ),

                                  ],
                                ),
                              ],
                            ),


                          ),
                        ),                    );


                  }
              );

            }

            else
              return CircularProgressIndicator();
          }
      ),
      ),
    );

  }
}

class MySampleState extends State<MySample> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: !useBackgroundImage
                ? const DecorationImage(
              image: ExactAssetImage('img/bg.png'),
              fit: BoxFit.fill,
            )
                : null,
            color: Colors.black,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.red,
                  backgroundImage:
                  useBackgroundImage ? 'img/card_bg.png' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'img/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Colors.white,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Glassmorphism',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useGlassMorphism,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useGlassMorphism = value;
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Card Image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useBackgroundImage,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useBackgroundImage = value;
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

class Ditalis extends StatefulWidget {
  final addres;
  final txt;
  final img;
  final vedio;

  const Ditalis({Key? key,this.img,this.txt,this.addres,this.vedio}) : super(key: key);

  @override
  _DitalisState createState() => _DitalisState();
}




class _DitalisState extends State<Ditalis> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '${widget.vedio}',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Directionality(
        textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("تعلم معنا",style: TextStyle(color: Colors.white),),

        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back))
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: ListView(

          children: [
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.addres,style: TextStyle(fontSize: 25),)
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width-100,
              child: Image.network(
                  "https://tpowep.com/edu/"+widget.img,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.txt,style: TextStyle(fontSize: 14,color: Colors.black),),

            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,



              ),
            ),
          ],

        ),
      ),

    )
    );

  }
}

