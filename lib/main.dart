import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MaterialColor MyColor=const MaterialColor(0XFF0C66BA);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color numberColor = Color(0xff0C66BA);
  Color symbolColor = Color(0xffE9A465);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 16.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 40.0),
                      ))),
              SizedBox(
                height: 72.0,
              ),
              Row(children: <Widget>[
                NumberPad("7", numberColor),
                NumberPad("8", numberColor),
                NumberPad("9", numberColor),
                NumberPad("+", symbolColor),
              ]),
              Row(children: <Widget>[
                NumberPad("4", numberColor),
                NumberPad("5", numberColor),
                NumberPad("6", numberColor),
                NumberPad("-", symbolColor),
              ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NumberPad("1", numberColor),
                    NumberPad("2", numberColor),
                    NumberPad("3", numberColor),
                    NumberPad("*", symbolColor),
                  ]),
              Row(children: <Widget>[
                NumberPad("C", symbolColor),
                NumberPad("0", numberColor),
                NumberPad("=", symbolColor),
                NumberPad("/", symbolColor),
              ]),
            ],
          )),
    );
  }

  Widget NumberPad(String btnText, Color btnColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(4),
        child: TextButton(
          onPressed: ()=>Calculation(btnText),
          child: Text(btnText,
              style: TextStyle(fontSize: 24.0, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: btnColor,
          ),
        ),
      ),
    );
  }

  String res, text = "";
  int first, second;
  String operator;
  void Calculation(String btnText) {
    if(btnText=="C"){
      res="";
    }else if(btnText=="+" || btnText=="-" || btnText=="*" || btnText=="/"){
      first=int.parse(text);
      operator=btnText;
    res="";
    }else if(btnText=="="){
      second=int.parse(text);

      if(operator=="+"){
        res=(first+second).toString();
      }
      if(operator=="-"){
        res=(first-second).toString();
      }
      if(operator=="*"){
        res=(first*second).toString();
      }
      if(operator=="/"){
        res=(first~/second).toString();
      }
    }else{
      res=text+btnText;

    }
    setState((){
      text=res.toString();
    });
  }
}
