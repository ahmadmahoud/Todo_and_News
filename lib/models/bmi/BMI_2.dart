
import 'package:flutter/material.dart';

class BMI_2 extends StatelessWidget {

  final int result;
  final bool isMale;
  final int age;

  BMI_2({
    required this.result,
    required this.isMale,
    required this.age,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("BMI"),
      ),
      body: Center(
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(15) , color: Colors.black87,),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('gender : ${isMale ? 'Male' : 'Female'} ' ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),
              Text('Result : $result', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),
              Text('Age : $age' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }

}
