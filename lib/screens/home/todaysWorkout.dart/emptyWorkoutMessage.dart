
import 'package:flutter/material.dart';

class EmptyWorkoutMessage extends StatelessWidget {
  const EmptyWorkoutMessage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:20, bottom:20),
      height: MediaQuery.of(context).size.height - 115, 
      decoration: const BoxDecoration(  
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          color: Color(0xFF006D77),
                        ),
      child: const  Align(  
        alignment: Alignment.center,
        child: Text("No workout today\n\ngo play some league of legends\n(Riot Games plz sponsor me)",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
        )
      )
    );
  }  
}