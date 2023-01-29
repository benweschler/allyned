import 'package:allyned/auth_service.dart';
import 'package:allyned/styles.dart';
import 'package:allyned/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/allynd_splash_gradient.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: Insets.xl * 1.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage("assets/images/allynd_logo_white.png")),
              const SizedBox(height: Insets.xl),
              CustomTextField(
                hintText: "Username",
                controller: emailController,
              ),
              const SizedBox(height: Insets.lg),
              CustomTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: Insets.xl * 1.5),
              LoginButton(
                login: () => context.read<AuthService>().login(
                      emailController.text,
                      passwordController.text,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  final Future Function() login;

  const LoginButton({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future? loginFuture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          loginFuture = widget.login();
          return;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(Insets.med),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: Corners.medBorderRadius,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Log In",
                  style: TextStyles.title1.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
