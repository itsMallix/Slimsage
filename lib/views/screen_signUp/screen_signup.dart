import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/bottom_bar.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/user_models/model_users.dart';
import 'package:miniproject/viewModels/viewModels_firebase_auth.dart';
import 'package:miniproject/viewModels/viewModels_users.dart';
import 'package:miniproject/views/screen_signIn/screen_signin.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formkey = GlobalKey<FormState>();
  bool obscureText = true;

  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  @override
  void dispose() {
    _unameController.dispose();
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Gunakan SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "SignUp Account",
                  style: DesignSystem.headlineLarge,
                ),
                const Text(
                  "Begin your health journey today with SlimSage",
                  style: DesignSystem.bodyMedium,
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 200,
                    child: SvgPicture.asset(
                      "assets/images/icons/app_logo.svg",
                      color: DesignSystem.mainGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _unameController,
                        cursorColor: DesignSystem.mainGreen,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_rounded,
                            color: DesignSystem.maingrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: DesignSystem.mainGreen, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Enter username",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: DesignSystem.mainGreen,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: DesignSystem.maingrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: DesignSystem.mainGreen, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Enter email",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: obscureText,
                        controller: _passwdController,
                        cursorColor: DesignSystem.mainGreen,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_rounded,
                            color: DesignSystem.maingrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: DesignSystem.mainGreen, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Enter password",
                          labelStyle: DesignSystem.labelLarge,
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = false;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_red_eye_rounded,
                                color: DesignSystem.maingrey,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: DesignSystem.mainGreen),
                          child: const Text(
                            "SignUp",
                            style: DesignSystem.headlineMediumWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    const Text(
                      "Already have an account?",
                      style: DesignSystem.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        "Sign In",
                        style: DesignSystem.bodyMediumCustom,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 40),
                const SafeArea(
                  child: Center(
                    child: Text(
                      "Slimsage © 2023",
                      style: DesignSystem.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _unameController.text;
    String email = _emailController.text;
    String password = _passwdController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter all fields!"),
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be at least 6 characters!"),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(
          color: DesignSystem.mainGreen,
        ),
      ),
    );

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('users_account');
      collRef.add({"username": username, "email": email, "password": password});

      Provider.of<UserManager>(context, listen: false)
          .setUserModel(UserModel(username: username, email: email));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully!"),
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomBar()),
        (route) => false,
      );
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to create account!"),
        ),
      );
    }
  }
}
