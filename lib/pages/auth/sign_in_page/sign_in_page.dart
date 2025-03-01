import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/components/logo_text_planta.dart';
import 'package:planta_care/pages/auth/components/auth_module.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withAlpha(0),
          elevation: 0,
          title: Row(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const LogoTextPlanta(),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SafeArea(
                    bottom: true,
                    child: AuthModule(
                      type: AuthModuleType.signIn,
                      // isLoading: _isSigningIn,
                      onContinuePressed: (email, password) async {
                        // setState(() {
                        //   _isSigningIn = true;
                        // });
                        // final userCredential =
                        //     await Auth.signInWithEmailAndPassword(
                        //   email: email,
                        //   password: password,
                        // );
                        // if (userCredential != null && context.mounted) {
                        //   print(userCredential);
                        //   // context.goNamed('/');
                        // }
                        // setState(() {
                        //   _isSigningIn = false;
                        // });
                        context.go('/home');
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
