import 'package:flutter/material.dart';
import 'package:spendify/pallete.dart';
import 'package:spendify/widgets/buttons/button.dart';
import 'package:spendify/widgets/fields/textfield.dart';
import 'package:spendify/views/terms_page.dart';

class Register2 extends StatefulWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confirmarContrasenaController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final double verticalSpacing = 24.0;
  bool _obscureText = true;
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.primary,
        title: const Text(
          "Registro",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: formKey,
              child: Builder(
                builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldGeneric(
                      textController: _correoController,
                      hintText: 'Correo Electrónico',
                      labelText: 'Correo Electrónico',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: null,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldGeneric(
                      textController: _contrasenaController,
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      validator: null,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldGeneric(
                      textController: _confirmarContrasenaController,
                      hintText: 'Confirmar Contraseña',
                      labelText: 'Confirmar Contraseña',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      validator: null,
                    ),
                    const SizedBox(height: 20.0),
                    // Checkbox para aceptar términos y condiciones
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndConditions()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: termsAccepted,
                              onChanged: (value) {
                                setState(() {
                                  termsAccepted = value!;
                                });
                              },
                            ),
                            const Text(
                              'Acepto los ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            const Text(
                              'términos y condiciones',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Pallete
                                    .primary, // Cambia el color del texto según lo necesites
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Button(
                      onPressed: () {
                        if (_correoController.text.isNotEmpty &&
                            _contrasenaController.text.isNotEmpty &&
                            _confirmarContrasenaController.text.isNotEmpty &&
                            termsAccepted) {
                          if (_contrasenaController.text ==
                              _confirmarContrasenaController.text) {
                            // Las contraseñas coinciden, y términos aceptados, proceder
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => NextPage()),
                            // );
                          } else {
                            // Las contraseñas no coinciden, mostrar mensaje de error
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Las contraseñas no coinciden.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Por favor, complete todos los campos y acepte los términos y condiciones.',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      label: 'Siguiente',
                    ),
                    SizedBox(height: verticalSpacing),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
