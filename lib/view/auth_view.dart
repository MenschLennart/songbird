import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.lightGreenAccent,
          padding: const EdgeInsets.all(12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
        onPressed: () => Navigator.of(context).popAndPushNamed('home'),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final forgotPasswordLink = TextButton(
      onPressed: () {},
      child: const Text(
        'Forgot password?',
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            color: Colors.white12,
            elevation: 5,
            margin: const EdgeInsets.all(20.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(32.0),
                children: <Widget>[
                  logo,
                  const SizedBox(height: 48.0),
                  email,
                  const SizedBox(height: 8.0),
                  password,
                  const SizedBox(height: 24.0),
                  loginButton,
                  forgotPasswordLink,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
