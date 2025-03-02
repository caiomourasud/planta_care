import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app_locale/app_locale.dart';
import 'package:planta_care/components/buttons/planta_filled_button.dart';
import 'package:planta_care/components/buttons/planta_outlined_button.dart';
import 'package:planta_care/components/divider_with_text.dart';
import 'package:planta_care/components/interactive_text.dart';
import 'package:planta_care/components/text_form_field/planta_text_form_field.dart';

enum AuthModuleType {
  signIn(title: 'log in'),
  signUp(title: 'Sign up');

  const AuthModuleType({
    required this.title,
  });

  final String title;
}

typedef AuthModuleOnContinuePressed = void Function(
  String email,
  String password,
);

class AuthModule extends StatefulWidget {
  const AuthModule({
    this.type = AuthModuleType.signIn,
    this.onContinuePressed,
    this.isLoading = false,
    super.key,
  });

  final AuthModuleType type;
  final AuthModuleOnContinuePressed? onContinuePressed;
  final bool isLoading;

  @override
  State<AuthModule> createState() => _AuthModuleState();
}

class _AuthModuleState extends State<AuthModule> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.type.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 12.0),
        Text(
          AppLocale.keepYourPlantsAliveDescription.getString(context),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
              ),
        ),
        const SizedBox(height: 20.0),
        AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocale.yourEmailAddress.getString(context),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12.0),
              PlantaTextFormField(
                context: context,
                readOnly: widget.isLoading,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
                hintText: 'supportplanta@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocale.emailIsRequired.getString(context);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              Text(
                AppLocale.chooseYourPassword.getString(context),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12.0),
              PlantaTextFormField(
                context: context,
                readOnly: widget.isLoading,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                hintText: AppLocale.min6Characters.getString(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocale.passwordIsRequired.getString(context);
                  }
                  if (value.length < 6) {
                    return AppLocale.passwordMustBeAtLeast6Characters
                        .getString(context);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              if (widget.type == AuthModuleType.signUp)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocale.confirmYourPassword.getString(context),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    PlantaTextFormField(
                      context: context,
                      readOnly: widget.isLoading,
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.none,
                      obscureText: true,
                      hintText:
                          AppLocale.confirmYourPassword.getString(context),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocale.passwordIsRequired
                              .getString(context);
                        }
                        if (value.length < 6) {
                          return AppLocale.passwordMustBeAtLeast6Characters
                              .getString(context);
                        }
                        return null;
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        PlantaFilledButton(
          context: context,
          isLoading: widget.isLoading,
          onPressed: () {
            widget.onContinuePressed?.call(
              _emailController.text,
              _passwordController.text,
            );
          },
          child: Text(
            AppLocale.continueButton.getString(context),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
        const SizedBox(height: 16.0),
        if (widget.type == AuthModuleType.signIn)
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocale.dontHaveAnAccount.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                  WidgetSpan(
                    child: IgnorePointer(
                      ignoring: widget.isLoading,
                      child: Opacity(
                        opacity: widget.isLoading ? 0.5 : 1.0,
                        child: InteractiveText(
                          text: AppLocale.signUp.getString(context),
                          onTap: () => context.push('/sign-up'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 32.0),
        if (widget.type == AuthModuleType.signIn)
          Column(
            children: [
              DividerWithText(text: AppLocale.orSignUpWith.getString(context)),
              const SizedBox(height: 32.0),
              IgnorePointer(
                ignoring: widget.isLoading,
                child: Opacity(
                  opacity: widget.isLoading ? 0.5 : 1.0,
                  child: PlantaOutlinedButton(
                    context: context,
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/google_logo.svg',
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            AppLocale.signInWithGoogle.getString(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              IgnorePointer(
                ignoring: widget.isLoading,
                child: Opacity(
                  opacity: widget.isLoading ? 0.5 : 1.0,
                  child: PlantaOutlinedButton(
                    context: context,
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/facebook_logo.svg',
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            AppLocale.signInWithFacebook.getString(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
      ],
    );
  }
}
