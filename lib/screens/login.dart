import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ocr_app/screens/home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;
  int success = 1;
  String userEmail = '';
  String errorMessage = '';
  final snackBar = const SnackBar(content: Text('Password reset email sent'));

  Future<void> _singIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() async {
        final navigator = Navigator.of(context);
        success = 2;
        userEmail = user.email!;
        await navigator.push(MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ));
      });
    } else {
      setState(() {
        success = 3;
      });
    }
  }

  Future<void> _resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: _emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/image_0.jpg',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.15,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromRGBO(195, 210, 255, 1),
                    elevation: 5,
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                              style: const TextStyle(),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.indigo,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required.';
                                }
                                return null;
                              },
                              style: const TextStyle(),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.indigo,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                          Center(
                            child: Text(errorMessage),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 120,
                                    right: 120,
                                    top: 20,
                                    bottom: 20)),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                try {
                                  _singIn();
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: const Text(
                              'SIGN IN',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  _resetPassword(email: _emailController.text);
                                 ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: const Text('Forgot password?'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You have\'t any account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.indigo,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup_screen');
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
