import 'package:flutter/material.dart';
import 'package:mob_bestmovieapp/utils/text.dart';


class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: modified_text(text:'Details')),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ElevatedButton(
          child: modified_text(text: 'back', color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),

    );
  }
}
