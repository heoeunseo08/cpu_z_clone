import 'package:flutter/material.dart';

class SystemScreen extends StatelessWidget {
  const SystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('systemScreen',
          style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
