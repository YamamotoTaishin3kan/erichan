import 'package:erichan/application/event_bus.dart';
import 'package:erichan/user_auth/entities/event/go_to_create_account_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Go2CreateAccountButton extends StatelessWidget {
  const Go2CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bus = Provider.of<EventBus>(context);
    return ElevatedButton(
      onPressed: () {
        bus.entrance.add(Go2CreateAccountEvent());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        onPrimary: Colors.black,
      ),
      child: Text("Create Account",
          textAlign: TextAlign.left,
          style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }
}
