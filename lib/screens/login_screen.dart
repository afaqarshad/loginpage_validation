import 'package:flutter/material.dart';
import 'package:loginpage_validation/screens/home_page.dart';
import 'package:loginpage_validation/widgets/textformfields.dart';

class LoginScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                MyTextFormFields(
                  controller: nameController,
                  labelText: "Full Name",
                  icon: Icons.person,
                  validationMsg: 'Please enter your name',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormFields(
                  controller: emailController,
                  labelText: "E-mail",
                  icon: Icons.email,
                  validationMsg: 'Please enter an E-mail',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFormFields(
                  controller: phonenumController,
                  labelText: "Phone No.",
                  icon: Icons.phone_android_sharp,
                  validationMsg: 'Please enter a phone no.',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    if (!_formkey.currentState!.validate()) {
                      emailController.clear();
                      passwordController.clear();
                      phonenumController.clear();
                      nameController.clear();
                      _formkey.currentState!.save();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          email: emailController.text,
                          phonenum: phonenumController.text,
                          name: nameController.text,
                          password: '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
