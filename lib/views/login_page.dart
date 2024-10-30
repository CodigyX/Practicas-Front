import 'package:flutter/material.dart';
import 'package:spendify/pallete.dart';
import 'package:spendify/widgets/fields/textfield.dart';
import 'package:spendify/widgets/buttons/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 225,
                  width: 225,
                ),
                const SizedBox(height: 15),
                TextFieldGeneric(
                  textController: emailController,
                  hintText: 'Correo electrónico o usuario',
                  labelText: 'Correo electrónico o usuario',
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                TextFieldGeneric(
                  textController: passwordController,
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                const SizedBox(height: 10),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // Lógica para recuperar contraseña
                    },
                    child: const Text(
                      '¿Olvidaste tu contraseña? Recupérala',
                      style: TextStyle(
                        color: Pallete.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Button(
                  onPressed: () {
                    // Aquí va la lógica para iniciar sesión
                  },
                  label: 'Iniciar sesión',
                ),
                const SizedBox(height: 10),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // Lógica para registrarse
                    },
                    child: const Text(
                      '¿No tienes cuenta? Regístrate',
                      style: TextStyle(
                        color: Pallete.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
