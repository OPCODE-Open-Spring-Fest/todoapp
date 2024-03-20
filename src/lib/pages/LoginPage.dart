import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/SignupPage.dart';
import 'package:todo_app/widgets/uihelper.dart';
import 'package:todo_app/services/auth.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Log In",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            uihelper.CustomButtom(
                () {}, "LogIn With Google", 'assets/google.svg',context),
            SizedBox(
              height: 20,
            ),
            uihelper.CustomButtom(
                () {}, "LogIn With Phone", 'assets/phone.svg',context),
            SizedBox(
              height: 10,
            ),
            Text(
              'Or',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            uihelper.CustomTextField(
                emailController, 'Email', Icons.mail, false,context),
            SizedBox(
              height: 20,
            ),
            uihelper.CustomTextField(
                passwordController, 'Password', Icons.password, true,context),
            SizedBox(
              height: 20,
            ),
            uihelper.CustomButtom1(() {
              authServices.logIn(emailController.text.toString(),
                  passwordController.text.toString(), context);
            }, "Log In",context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
