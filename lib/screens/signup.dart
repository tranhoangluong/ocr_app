import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  late bool success;
  late String? _userEmail;

  Future<void> _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        success = true;
        _userEmail = user.email;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Bạn đã đăng kí thành công tài khoản $_userEmail')));
      });
    } else {
      success = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Create an account. It\'s free.',
                        style: TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                      Image.asset('assets/images/image_1.png'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'E-mail address is required.';
                            }
                            String pattern = r'\w+@\w+\.\w+';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Invalid E-mail Address format.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email:',
                            labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required.';
                            }
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Password must be at least 8 characters,'
                                  '\ninclude an uppercase letter, number and symbol.';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Password:',
                            labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please retype password.';
                      }
                      if (value != _passwordController.text) {
                        return 'Password must be same as above.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Confirm password:',
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.only(
                          left: 120, right: 120, top: 20, bottom: 20)),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      try {
                        _register();
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                      }
                      setState(() => isLoading = false);
                    }
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.indigo,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
