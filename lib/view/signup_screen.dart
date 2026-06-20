
import 'package:appscrip_project/utils/app_text_field.dart';
import 'package:appscrip_project/utils/mediaquery.dart';
import 'package:appscrip_project/view/home_screen/home_screen.dart';
import 'package:appscrip_project/widget/app_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaqueryheight(0.30, context),
                ),
                const Text(
                  'sign up',
                  style: TextStyle(fontSize: 36),
                ),
                Inputfield(
                  controller: nameController,
                  hinttext: 'UserName',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                Inputfield(
                  controller: emailController,
                  hinttext: 'email',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please enter your email";
                    } else {
                      return null;
                    }
                  },
                ),
                PasswordField(
                  controller: passwordController,
                  hinttext: 'password',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please enter your password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: mediaqueryheight(0.02, context),
                ),
                CustomButtonForTest(
                  formKey: _formKey,
                  email: emailController.text,
                  name: nameController.text,
                  pass: passwordController.text,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonForTest extends StatelessWidget {
  final String name;
  final String email;
  final String pass;
  const CustomButtonForTest({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.name,
    required this.email,
    required this.pass,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        function: () {
          if (_formKey.currentState!.validate()) {
            print(name);
            print(email);
            print(pass);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else {
            return;
          }
        },
        text: 'click here',
        fontSize: mediaquerywidth(0.04, context),
        buttonTextColor: Colors.white,
        borderColor: Colors.black,
      ),
    );
  }
}
