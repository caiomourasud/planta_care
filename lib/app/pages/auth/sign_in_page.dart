import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:planta_care/app/components/logo_text_planta.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/app/pages/auth/components/auth_module.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSigningIn = false;

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
          title: const Align(
            alignment: Alignment.bottomRight,
            child: LogoTextPlanta(),
          ),
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: ScaffoldElevatedContainer(),
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
                      isLoading: _isSigningIn,
                      onContinuePressed: (email, password) async {
                        setState(() {
                          _isSigningIn = true;
                        });
                        await Auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                          context: context,
                        );
                        setState(() {
                          _isSigningIn = false;
                        });
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
