import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instagram_clone/authentication.dart';
import 'package:instagram_clone/dialog.dart';
import 'package:instagram_clone/firebase_auth.dart';
import 'package:instagram_clone/image_picker.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;
  const SignupScreen(this.show, {super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  final TextEditingController usernameController = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  final TextEditingController bioController = TextEditingController();
  FocusNode bioFocus = FocusNode();
  final TextEditingController con_passwordController = TextEditingController();
  FocusNode con_passwordFocus = FocusNode();
  File? _imageFile;

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
            Center(
                child: InkWell(
              onTap: () async {
                File _imageFilee = await ImagePickerService().uploadImage('gallery');
                setState(() {
                  _imageFile = _imageFilee;
                });
              },
              child: CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.grey,
                  child: _imageFile == null
                      ? CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundImage: AssetImage('images/user.png'),
                          radius: 30,
                          backgroundColor: Colors.grey,
                        )
                      : CircleAvatar(
                          radius: 34,
                          backgroundImage: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ).image,
                          backgroundColor: Colors.grey,
                        )),
            )),
            Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customTextField(
                        emailController, Icons.email, "Email", emailFocus),
                    customTextField(usernameController, Icons.person,
                        "Username", usernameFocus),
                    customTextField(bioController, Icons.abc, "Bio", bioFocus),
                    customTextField(passwordController, Icons.lock, "Password",
                        passwordFocus),
                    customTextField(con_passwordController, Icons.lock,
                        "Confirm password", con_passwordFocus),
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
                    Signup(),
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

  Widget Signup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: widget.show,
        child: InkWell(
          onTap: () async {
            try {
              await Authentication().signup(
                email: emailController.text,
                password: passwordController.text,
                conPassword: con_passwordController.text,
                username: usernameController.text,
                bio: bioController.text,
                profile: _imageFile ?? File(''),
              );
            } catch (e) {
              print(e.toString());
              dialogBuilder(context, e.toString());
            }
          },
          child: Container(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
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
