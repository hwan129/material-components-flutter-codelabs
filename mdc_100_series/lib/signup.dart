import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  // 유효성 검사 함수
  String? _usernameValidator(String? value) {
    RegExp usernameRegExp =
        RegExp(r'^(?=.*[A-Za-z].*[A-Za-z].*[A-Za-z])(?=.*\d.*\d.*\d).+$');
    if (value == null || value.isEmpty || !usernameRegExp.hasMatch(value)) {
      return 'Username is invalid';
    }
    return null; // 유효한 경우 null 반환
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null; // 유효한 경우 null 반환
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }
    if (value != _password) {
      return 'Confirm Password doesn\'t match Password';
    }
    return null; // 유효한 경우 null 반환
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Email Address';
    }
    return null; // 유효한 경우 null 반환
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // 모든 입력이 유효하면 수행할 작업
      Navigator.pushNamed(context, '/login');
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIGN UP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form 위젯에 GlobalKey 할당
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                validator: _usernameValidator,
              ),
              const SizedBox(height: 0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: _passwordValidator,
              ),
              const SizedBox(height: 0),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
                validator: _confirmPasswordValidator,
              ),
              const SizedBox(height: 0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: _emailValidator,
              ),
              const SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFd6d6d6),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: _signUp,
                    child: const Text('SIGN UP'),
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
