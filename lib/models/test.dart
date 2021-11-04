import 'package:dotted_border/dotted_border.dart';
import 'package:first_app/shared/componant/componant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
   bool isPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("Text" , textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultFormField(
                isPassword : false,
                suffix: isPassword ? Icons.visibility_off : Icons.visibility,
                suffixPressed: (){
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
                controller: passwordController,
                label: 'Password',
                prefix: Icons.lock_outline,
                type: TextInputType.visiblePassword,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is Empty';
                  }
                }),

        ]
        ),
      ),
    );
  }
}
