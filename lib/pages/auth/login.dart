import 'package:flutter/material.dart';
import 'package:go_publish/pages/auth/signin.dart';
import 'package:go_publish/pages/home.dart';
import 'package:form_validator/form_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Initially password is obscure
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      //TODO CHECK LOGIN AND STATUS
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'abril',
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: const Text(
                    'Color your days and make your story',
                    style: TextStyle(
                      color: Color(0xff718096),
                      fontSize: 15,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                child: TextFormField(
                  controller: emailController,
                  validator: ValidationBuilder().required().build(),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffBAA394))),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  validator:
                  ValidationBuilder().required().minLength(6).build(),
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffBAA394))),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: _obscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffBAA394),
                    ),
                    child: const Text('Login'),
                    onPressed: () {
                      _validateAndSubmit();
                      debugPrint("name : ${emailController.text}");
                      debugPrint("pass : ${passwordController.text}");
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('New Member?',
                      style: TextStyle(
                          color: Color(0xff718096),
                          fontSize: 15,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500)),
                  TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffFF6B42),
                          fontFamily: 'inter'),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}