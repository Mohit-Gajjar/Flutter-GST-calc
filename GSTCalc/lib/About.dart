import 'package:flutter/material.dart';

class aboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xff2D2929),
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: 
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Center(
                    child: Image.asset('asset/logo.png'),
                  ),
                ),
              ),
            Container(
            child: Text('Developed By: Mohit Gajjar'+'\n'+'Email: gajjarmohit501@gmail.com',
            style: TextStyle(color: Colors.amber,
            fontSize: 20),
            ),
          )
        ],    
      ),  
    );
  }
}
