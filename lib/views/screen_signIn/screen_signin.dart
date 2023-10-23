import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/bottom_bar.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/model_users.dart';
import 'package:miniproject/viewModels/viewModels_firebase_auth.dart';
import 'package:miniproject/viewModels/viewModels_users.dart';
import 'package:miniproject/views/screen_signUp/screen_signup.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String username = '';
  bool _isSignin = false;

  final _formkey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _emailController = TextEditingController();
  final _passwdController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final userManager = Provider.of<UserManager>(context);
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
                  "Login Account",
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
                const SizedBox(height: 90),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter email",
                          labelStyle: DesignSystem.labelLarge,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        controller: _passwdController,
                        decoration: InputDecoration(
                          labelText: "Enter password",
                          labelStyle: DesignSystem.labelLarge,
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
                          onPressed: _signIn,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: DesignSystem.mainGreen),
                          child: const Text(
                            "Sign In",
                            style: DesignSystem.headlineMediumWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or login with",
                              style: DesignSystem.bodySmall,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_google.svg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_facebook.svg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: DesignSystem.white),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/logo_apple.svg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    const Text(
                      "Don't have an account?",
                      style: DesignSystem.bodyMedium,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        "Sign Up",
                        style: DesignSystem.bodyMediumCustom,
                      ),
                    ),
                    const Spacer(),
                  ],
                  // const Center(
                  //   child: Text(
                  //     "The first step towards a healthier life.",
                  //     style: DesignSystem.bodyMedium,
                  //   ),
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

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwdController.text;
    const CircularProgressIndicator();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email and password!"),
        ),
      );
      return;
    }
    // Display a circular progress indicator
    setState(() {
      _isSignin = true;
    });

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('users_account');
      QuerySnapshot querySnapshot =
          await collRef.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        String username = querySnapshot.docs[0]['username'];
        Provider.of<UserManager>(context, listen: false)
            .setUserModel(UserModel(username: username, email: email));
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account sign in successfully!"),
        ),
      );

      // Remove the circular progress indicator and navigate to the home screen
      setState(() {
        _isSignin = false;
      });

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email or password is incorrect!"),
        ),
      );

      // Remove the circular progress indicator when login fails
      setState(() {
        _isSignin = false;
      });
    }
  }

  // void _signIn() async {
  //   String email = _emailController.text;
  //   String password = _passwdController.text;

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   if (user != null) {
  //     CollectionReference collRef =
  //         FirebaseFirestore.instance.collection('users_account');
  //     QuerySnapshot querySnapshot =
  //         await collRef.where('email', isEqualTo: email).get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       String username = querySnapshot.docs[0]['username'];
  //       Provider.of<UserManager>(context, listen: false)
  //           .setUserModel(UserModel(username: username, email: email));
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Account sign in successfully!"),
  //       ),
  //     );
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => const BottomBar()),
  //         (route) => false);
  //   }
  //   if (_emailController.text.isEmpty || _passwdController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Please enter your email and password!"),
  //       ),
  //     );
  //   }
  // }
}
