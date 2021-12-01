import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 30, 5), // もっといいのありそう
                child: Text(
                  "create account",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'HomeScreen');
                },
                child: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
