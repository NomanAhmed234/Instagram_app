import 'package:flutter/material.dart';
// import 'package:instagram_clone/authentication.dart';
import 'package:instagram_clone/dialog.dart';
import 'package:instagram_clone/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;
  const LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(),
            Center(
              child: Image.asset(
                'images/instagramlogo.png',
                width: 200,
              ),
            ),
            Container(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customTextField(
                        emailController, Icons.email, "Email", emailFocus),
                    customTextField(passwordController, Icons.lock, "Password",
                        passwordFocus),
                    SizedBox(),
                    ForgotPassword(),
                  ],
                )),
            Container(
              height: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Login(),
                    SizedBox(),
                    DontHaveAccount(),
                  ]),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget Login() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () async {
          try {
            await Authentication().login(
              email: emailController.text,
              password: passwordController.text,
            );
          } catch (e) {
            print(e.toString());
            dialogBuilder(context, e.toString());
          }
        },
        child: Container(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          alignment: Alignment.center,
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget ForgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Forgot password?",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget DontHaveAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Don't have an account",
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  Widget customTextField(TextEditingController controller, IconData icon,
      String type, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: type,
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Colors.black : Colors.grey,
            ),
          ),
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
