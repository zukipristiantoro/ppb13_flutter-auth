import 'dart:math';

import 'package:firebase/Screen/live_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => jumpToLivePage(context, isHost: true),
              child: const Text("Start a Live"),
            ),
            ElevatedButton(
              onPressed: () => jumpToLivePage(context, isHost: false),
              child: const Text("Watch a Live "),
            ),
          ],
        ),
      ),
    );
  }

  jumpToLivePage(BuildContext context, {required bool isHost}) {
    String liveID = generateLiveID();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LivePage(
                  liveID: liveID,
                  isHost: isHost,
                )));
  }

  String generateLiveID() {
    // Generate a random alphanumeric string for liveID
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const length = 10; // Adjust the length as needed
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
