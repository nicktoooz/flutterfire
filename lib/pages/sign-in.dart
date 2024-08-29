import 'package:flutter/material.dart';
import 'package:flutterfire/app_database.dart';
import 'package:flutterfire/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String _usernameError = "";
  String _passwordError = "";

  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _usernameError = "";
      _passwordError = "";
    });

    // Validate inputs
    if (_usernameController.text.isEmpty) {
      setState(() {
        _usernameError = "Username cannot be empty";
      });
      return;
    } else if (_usernameController.text.length < 8) {
      setState(() {
        _usernameError = "Username must have at least 8 characters";
      });
      return;
    }
    if (_passwordController.text.isEmpty) {
      setState(() {
        _passwordError = "Password cannot be empty";
      });
      return;
    } else if (_passwordController.text.length < 8) {
      setState(() {
        _passwordError = "Password must have at least 8 characters";
      });
      return;
    }

    final uid = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      await signUpUser(uid, _usernameController.text, _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User signed up with UID: $uid')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing up user: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/flutter.png')),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        onChanged: (val) {
                          setState(() {
                            _usernameError = "";
                          });
                        },
                        focusNode: _usernameFocusNode,
                        style: const TextStyle(color: Color(0xFF0062E8)),
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: _usernameController.text.isNotEmpty ||
                                    _usernameFocusNode.hasFocus
                                ? const Color(0xFF0062E8)
                                : Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: _usernameController.text.isNotEmpty ||
                                    _usernameFocusNode.hasFocus
                                ? const Color(0xFF0062E8)
                                : Colors.grey,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF0062E8), width: 2),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            _usernameError,
                            style: TextStyle(color: Color(0xffd9534f)),
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _passwordController,
                        onChanged: (val) {
                          setState(() {
                            _passwordError = "";
                          });
                        },
                        focusNode: _passwordFocusNode,
                        obscureText: !isVisible,
                        style: const TextStyle(color: Color(0xFF0062E8)),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: _passwordController.text.isNotEmpty ||
                                    _passwordFocusNode.hasFocus
                                ? const Color(0xFF0062E8)
                                : Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: _passwordController.text.isNotEmpty ||
                                    _passwordFocusNode.hasFocus
                                ? const Color(0xFF0062E8)
                                : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(!isVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF0062E8), width: 2),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            _passwordError,
                            style: TextStyle(color: Color(0xffd9534f)),
                          ))
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      )),
                      onPressed: _signIn,
                      child: const Text(
                        'Sign In',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      )),
                      onPressed: () {
                        // Handle Register button press
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signUpUser(String uid, String email, String password) async {
  final appDatabase = AppDatabase.instance;

  final newUser = User(
    uid: uid,
    email: email,
    password: password,
  );

  try {
    await appDatabase.signUp(newUser);
  } catch (e) {
    throw Exception('Error signing up user: $e');
  }
}
