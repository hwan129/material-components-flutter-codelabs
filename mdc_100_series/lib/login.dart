import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Remove filled: true values (103)
            // TODO: Add TextField widgets (101)
            // TODO: Add TextField widgets (101)
            // [Name]
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            // TODO: Add button bar (101)
            OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: const Text('CANCEL'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: const Text('Sign Up'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFd6d6d6),
                    foregroundColor: Colors.black,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: const Text('NEXT'),
                  onPressed: () {
                    // TODO: Show the next page (101)
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
