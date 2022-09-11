import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Container(
      height: 400,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        "https://media.istockphoto.com/vectors/login-form-user-interface-vector-vector-id1071047018?k=20&m=1071047018&s=612x612&w=0&h=-sAUUtX2KZb43JZPQp65-GHpEHZ-jxWoUS-jp1VTqpc=",
        fit: BoxFit.cover,
      ),
    );
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            cont,
             AnimatedAlign(
              duration: Duration(milliseconds: 500) ,
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 50, bottom: 20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                validator: (text) {
                  if (RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$")
                      .hasMatch(text!)) {
                    return null;
                  }
                  return "wrong password";
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp("[a-z]"))
                  // FilteringTextInputFormatter.allow(RegExp("[0-9][a-b]")),
                  // TextInputFormatter.withFunction(
                  //   (oldValue, newValue) {
                  //     return newValue.copyWith(
                  //         text: newValue.text.replaceAll("a", ""));
                  //   },
                  // ),
                ],
                decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    hintText: "UerName"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    hintText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.amberAccent,
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  onPressed: () {},
                  child: SizedBox(
                      height: 30,
                      width: double.maxFinite,
                      child: Center(child: Text("sign in")))),
            )
          ],
        ),
      ),
    );
  }
}
