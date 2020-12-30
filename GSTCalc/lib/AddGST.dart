import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddGST extends StatefulWidget {
  @override
  _AddGSTState createState() => _AddGSTState();
}

TextEditingController num1controller = new TextEditingController();
TextEditingController num2controller = new TextEditingController();
  bool _validate = false;
String result = "0";
double per = 100;
String netResult = "0";
double netAmt;

class _AddGSTState extends State<AddGST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        
        backgroundColor: Color(0xff2D2929),
        body: SingleChildScrollView(
            child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
              child: TextField(
                  onSubmitted: (input) {
                    // amtSub(input);
                    print(input);
                  },
                  controller: num1controller,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Color(0xff707070), fontSize: 30),
                  decoration: InputDecoration(
                      labelText: 'Enter Amount(₹)',
                       errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      labelStyle: TextStyle(color: Color(0xff707070)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[900]),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[900]),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Color(0xff423131)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ]),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
                onSubmitted: (input) {},
                controller: num2controller,
                textAlign: TextAlign.end,
                style: TextStyle(color: Color(0xff707070), fontSize: 20),
                decoration: InputDecoration(
                    labelText: 'Enter GST Rate(%)',
                     errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    labelStyle: TextStyle(color: Color(0xff707070)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[900]),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: Color(0xff423131)),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]),
          ),
          SizedBox(height: 20),
          Container(
            width: 360,
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xff707070),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                  'GST Rate: ' '$result' +
                      ' ₹' +
                      '\nNet Amount: ' +
                      '$netResult' +
                      ' ₹',
                  style: TextStyle(fontSize: 20, color: Color(0xff707070))),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 200),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  double sum = (double.parse(num1controller.text) *
                          int.parse(num2controller.text)) /
                      double.parse(per.toString());
                  result = sum.toString();
                  netAmt =
                      (double.parse(result) + int.parse(num1controller.text));
                });
                netResult = netAmt.toString();
                print(result);
              },
              child: Text(
                'Find',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[600],
                ),
              ),
              shape: StadiumBorder(),
              color: Colors.amber[600],
              padding: EdgeInsets.fromLTRB(40, 18, 40, 18),
            ),
          ),
        ])));
  }
}
