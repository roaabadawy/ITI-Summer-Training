import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/views/screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,

        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Image.asset('assets/images/img.png',
                    width: 200,
                    height: 200,
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),

                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),

                  ),
                  validator: (value) {
                    if (value == null || value.contains("@")== false) {
                      return 'Enter valid email';
                    }
                  },


                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        )),
                  ),
                  validator: (value) {
                    if (value == null || value.length<8) {
                      return 'Enter valid password';
                    }
                  },
                ),
                const SizedBox(height: 50),

                MaterialButton(
                    elevation: 5.0,
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,

                      ),

                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()){
                        bool result =  await firebaselogin(emailController.text, passwordController.text);
                        if (result == null){
                           final SharedPreferences prefs = await SharedPreferences.getInstance();
                           await prefs.setString('email', emailController.text);

                           Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) =>  HomeScreen(
                               email: emailController.text,
                             )),

                             );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('login failed')),
                          );
                        }
                      }
                    }),
                const SizedBox(height: 30),

                GestureDetector(
                  onTap: (){
                    print('Forget the Password?');
                  },
                  child: const Text('Forget the Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                  ),

                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: (){
                    print('Sign Up');
                  },
                  child: const Text('Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> firebaselogin(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      if (userCredential.user != null){
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
