import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginpage_validation/widgets/textformfields.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool _obsText = true;
  File? imageFile;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenumController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
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
                    obscureText: _obsText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _obsText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obsText = !_obsText;
                          });
                        },
                      ),
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
                  ElevatedButton(
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: const Text("PICK FROM GALLERY"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.route, arguments: {
                        'email': emailController.text,
                        'phonenum': phonenumController.text,
                        'name': nameController.text,
                        'password': passwordController.text,
                        'image': imageFile,
                      });
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
      ),
    );
  }
}
