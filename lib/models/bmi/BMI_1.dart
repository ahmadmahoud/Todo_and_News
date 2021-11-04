
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BMI_2.dart';



class BMI_1 extends StatefulWidget {

  @override
  _BMI_1State createState() => _BMI_1State();
}

class _BMI_1State extends State<BMI_1> {

  double height = 120;
  int age = 5;
  int weight = 30;
  bool isMale = true;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Icon(Icons.menu_rounded),
        title: Text('BMI'),
      ),
      body: Container(
      color: Colors.black87,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Expanded(
                        // لكي اتمكن من الضغط على Container استخدم العباره GestureDetector
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) , color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage('image/geecoders.png'), width: 50 , height: 50,),
                                Text("Geecoders" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22 , color: isMale ? Colors.blue : Colors.white),),
                              ],
                            ),

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) , color: Colors.black54),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female_rounded, size:60 , color: isMale ? Colors.white : Colors.blue, ),
                                Text("Female" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 22 , color: isMale ? Colors.white : Colors.blue)),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],),
                  )
                ],
              ),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(15) , color: Colors.black54),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("HEIGHT" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: Colors.white),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                     Text("${height.round()}" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold , color: Colors.white),),
                     Text("cm" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                   ],),
                   Slider(value: height,
                       max: 220,
                       min: 50,
                       onChanged: (value){
                          setState(() {
                            height = value;
                          });
                       }),

                 ],
                ),
              ),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) , color: Colors.black54),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT' , style: TextStyle(fontSize: 22 , color: Colors.white24),),
                          Text('$weight' , style: TextStyle(fontSize: 28 , color: Colors.white , fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                               setState(() {
                                 weight++;
                               });
                              } ,
                                // عليك بتمييز كل floating باستخدام tag مختلف لعدم حدوث مشاكل
                                heroTag: "weight++",
                                mini: true , child: Icon(Icons.add),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              } ,
                                // عليك بتمييز كل floating باستخدام tag مختلف لعدم حدوث مشاكل
                                heroTag: "weight--",
                                mini: true , child:Icon(Icons.remove),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) , color: Colors.black54),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE' , style: TextStyle(fontSize: 22 , color: Colors.white24),),
                          Text('$age' , style: TextStyle(fontSize: 28 , color: Colors.white , fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              } ,
                                heroTag: "age++",
                                mini: true , child: Icon(Icons.add),),
                              FloatingActionButton(onPressed: (){
                               setState(() {
                                 age--;
                               });
                              } ,
                                heroTag: "age--",
                                mini: true ,
                                child:Icon(Icons.remove),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(onPressed: (){
                  // العملية الحسابية
                  var result = weight / pow(height / 100 , 2);
                  
                  // الانتقال من اسكرين للاخرى
                  // ونقوم بعمل import للنوع الـ dart
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BMI_2(
                    age: age,
                    isMale: isMale,
                    result: result.round(),
                  ),
                  ),
                  );
                },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(12) , topEnd: Radius.circular(12))),
                  child: Text('Calcolate' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),), color: Colors.blue[900],)),
          ],
        ),
      ),
    );
  }
}
