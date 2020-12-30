import 'package:GSTCalc/About.dart';
import 'package:GSTCalc/Add.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/addGstPage': (BuildContext context) => new AddGst(),
        '/aboutPage': (BuildContext context) => new aboutMe()
      },
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          '$btntxt',
          style: TextStyle(
            fontSize: 30,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xff2D2929),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Calc',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/aboutPage');
            },
            icon: Icon(Icons.bug_report_outlined),
            color: Colors.amber,
            iconSize: 30,
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: 320,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xff707070),
                            width: 1,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(10),
                              child: Text('$text',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 60, color: Color(0xff707070)))),
                        ),
                      )))
            ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calcbutton('C', Colors.amber[600], Color(0xff707070)),
                calcbutton('+/-', Colors.amber[600], Color(0xff707070)),
                calcbutton('%', Colors.amber[600], Color(0xff707070)),
                calcbutton('/', Colors.amber[600], Color(0xff707070)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calcbutton('7', Colors.grey[900], Color(0xff707070)),
                calcbutton('8', Colors.grey[900], Color(0xff707070)),
                calcbutton('9', Colors.grey[900], Color(0xff707070)),
                calcbutton('x', Colors.amber[600], Color(0xff707070)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calcbutton('4', Colors.grey[900], Color(0xff707070)),
                calcbutton('5', Colors.grey[900], Color(0xff707070)),
                calcbutton('6', Colors.grey[900], Color(0xff707070)),
                calcbutton('-', Colors.amber[600], Color(0xff707070)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calcbutton('1', Colors.grey[900], Color(0xff707070)),
                calcbutton('2', Colors.grey[900], Color(0xff707070)),
                calcbutton('3', Colors.grey[900], Color(0xff707070)),
                calcbutton('+', Colors.amber[600], Color(0xff707070)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calcbutton('.', Colors.grey[900], Color(0xff707070)),
                calcbutton('0', Colors.grey[900], Color(0xff707070)),
                calcbutton('=', Colors.amber[200], Color(0xff707070)),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/addGstPage');
                  },
                  child: Text(
                    'GST',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff707070),
                    ),
                  ),
                  shape: CircleBorder(),
                  color: Colors.amber[600],
                  padding: EdgeInsets.all(20),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text = '';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
