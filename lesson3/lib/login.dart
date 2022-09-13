//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final global = GlobalKey<FormState>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 198, 200, 203),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/coupon-test-18a.appspot.com/o/undraw_access_account_re_8spm.png?alt=media"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(
              key: global,
              child: Column(
                children: [
                  const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) return "required";
                      if (text.length > 10) return "max length 10";
                      if (text.length < 4) return "min length 3";
//^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Username",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  TextFormField(
                    validator: (text) {
                      if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                          .hasMatch(text!)) {
                        return "enter valid email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny("3")
                    ],
                    decoration: InputDecoration(
                        hintText: "Phone number",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (!RegExp(
                              r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
                          .hasMatch(text!)) {
                        return "enter valida password";
                      }

                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(30)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      global.currentState!.validate();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 40,
                        child: Center(child: Text("Sign in"))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
