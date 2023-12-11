import 'package:flutter/material.dart';
import 'db_helper.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                        null,
                        _usernameController.text,
                        _passwordController
                            .text, // Assuming you have a password field
                        _phoneController.text,
                        _emailController.text,
                        _addressController.text,
                      );

                      DBHelper dbHelper = DBHelper();
                      await dbHelper.saveUser(user);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User data saved')),
                      );

                      // Redirect to the main screen or any other screen as needed
                      Navigator.pushNamed(context, '/main');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
