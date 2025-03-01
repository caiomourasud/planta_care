import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
          'Keep your plants alive by watering, '
          'providing sunlight and checking for pests.',
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
                'Your email address',
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
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              Text(
                'Choose your password',
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
                hintText: 'Min 6 characters',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
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
                      'Confirm your password',
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
                      hintText: 'Confirm your password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
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
            'Continue',
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
                    text: "Don't have an account ",
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
                          text: 'Sign up',
                          onTap: () => context.pushNamed('/sign-up'),
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
              const DividerWithText(text: 'Or Sign up with'),
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
                            'Sign up with google',
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
                            'Sign up with facebook',
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
