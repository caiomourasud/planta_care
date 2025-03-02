import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/components/logo_text_planta.dart';
import 'package:planta_care/components/scaffold_elevated_container.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/pages/auth/components/auth_module.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Row(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlantaAppBarButton(
                context: context,
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              const LogoTextPlanta(),
            ],
          ),
        ),
        body: Stack(
          children: [
            const ScaffoldElevatedContainer(),
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
                      type: AuthModuleType.signUp,
                      isLoading: _isCreatingAccount,
                      onContinuePressed: (email, password) async {
                        setState(() {
                          _isCreatingAccount = true;
                        });
                        final userCredential =
                            await Auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (userCredential != null && context.mounted) {
                          context.goNamed('/login');
                        }
                        setState(() {
                          _isCreatingAccount = false;
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
