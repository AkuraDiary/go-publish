import 'package:flutter/material.dart';
import 'package:go_publish/pages/auth/login.dart';
import 'package:go_publish/pages/home.dart';
import 'package:form_validator/form_validator.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool is_mitra = false;

  void validateAndSave() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      debugPrint('Form is valid');
    } else {
      debugPrint('Form is invalid');
    }
  }

  // Initially password is obscure
  bool _obscureText = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nibController = TextEditingController();
  TextEditingController bussinessNameController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      //TODO do signin and save the user session
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    nibController.dispose();
    super.dispose();
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
                  'Create Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'abril',
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  controller: nameController,
                  validator: ValidationBuilder().required().build(),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffBAA394))),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  controller: emailController,
                  validator: ValidationBuilder()
                      .required()
                      .email("Email is Invalid")
                      .build(),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffBAA394))),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                ),
              ),
              CheckboxListTile(
                title: const Text(
                  'Saya Seorang Mitra UMKM',
                  style: TextStyle(
                    color: Color(0xff718096),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: is_mitra,
                onChanged: (bool? value) {
                  setState(
                    () {
                      is_mitra = value!;
                    },
                  );
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              is_mitra
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: nibController,
                        validator: ValidationBuilder().required().build(),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffBAA394))),
                          labelText: 'Nomor Induk Berusaha',
                        ),
                      ),
                    )
                  : Container(),
              is_mitra ? Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  enabled: is_mitra,
                  controller: nibController,
                  validator: ValidationBuilder().required().build(),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffBAA394))),
                    labelText: 'NIB anda',
                  ),
                ),
              )
                  : Container(),


              Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff214782),
                    ),
                    child: const Text('Register'),
                    onPressed: () {
                      _validateAndSubmit();
                      debugPrint("name : ${nameController.text}");
                      debugPrint("pass : ${passwordController.text}");
                      debugPrint("email : ${emailController.text}");
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have account?',
                      style: TextStyle(
                          color: Color(0xff718096),
                          fontSize: 15,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w500)),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffF76D3A),
                      ),
                    ),
                    onPressed: () {
                      //login screen
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
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
