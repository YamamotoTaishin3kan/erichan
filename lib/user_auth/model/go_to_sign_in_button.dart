import 'package:erichan/application/event_bus.dart';
import 'package:erichan/user_auth/event/go_to_sign_in_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Go2SignInButton extends StatelessWidget {
  const Go2SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bus = Provider.of<EventBus>(context);
    return ElevatedButton(
      onPressed: () {
        bus.entrance.add(GoTo2SignInEvent());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        onPrimary: Colors.black,
      ),
      child: Text("サインインしたい",
          textAlign: TextAlign.left,
          style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }
}
