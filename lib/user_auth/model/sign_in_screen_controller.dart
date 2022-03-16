import 'package:erichan/application/event_bus.dart';
import 'package:erichan/user_auth/event/go_to_create_account_event.dart';
import 'package:erichan/user_auth/event/go_to_sign_in_event.dart';
import 'package:erichan/user_auth/model/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_account.dart';
import '../../error_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreenController extends StatelessWidget {
  const SignInScreenController(this._authenticated, {Key? key})
      : super(key: key);
  final Widget _authenticated;

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, user) {
          switch (user.connectionState) {
            case ConnectionState.none:
              return const AuthError();
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              return user.hasData ? _authenticated : const InitialScreen();
            case ConnectionState.done:
              return const AuthError();
          }
        },
      );
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bus = Provider.of<EventBus>(context);
    return StreamBuilder<Event>(
        stream: bus.exit,
        builder: (context, event) {
          if (!event.hasData) {
            return SignInScreen();
          }
          if (event.data! is Go2CreateAccountEvent) {
            return CreateAccountScreen();
          } else if (event.data! is GoTo2SignInEvent) {
            return SignInScreen();
          } else {
            return SignInScreen();
          }
        });
  }
}
