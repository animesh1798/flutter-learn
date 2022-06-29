import 'package:demo/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your email'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
                'We\'ve sent you an email-verfication. Please open it to verify your account'),
            const Text('If you haven\'t received the mail, press the button'),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                await user?.sendEmailVerification();
              },
              child: const Text('Send email verification'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}
