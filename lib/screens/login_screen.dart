import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Back...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Enter email & password',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18 ,
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Email',
                    hintText: 'wasem@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.send),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 10,
                      maxHeight: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
