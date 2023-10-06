import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly:
              true, // Set to true to use only biometrics (Face ID/Touch ID),
        ),
      );
    } catch (e) {
      print('Error during authentication: $e');
    }

    if (authenticated) {
      print('User authenticated successfully');
    } else {
      print('Authentication failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Authentication Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _authenticate,
          child: Text('Authenticate'),
        ),
      ),
    );
  }
}
