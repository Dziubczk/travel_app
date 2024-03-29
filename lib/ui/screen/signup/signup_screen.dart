import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.onSignInPressed})
      : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  bool isWrongPassword = false;

  _onSignUpPressed() {
    Navigator.of(context).pushReplacementNamed(HOME);
  }

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      child: TextField(
        cursorColor: Colors.white,
        cursorWidth: 2,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor:
              // Color(0xFF5180ff),
              Colors.teal[700],
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }

  // Widget _buildForgotPasswordButton() {
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: TextButton(
  //       child: const Text(
  //         'Forgot Password?',
  //         style: TextStyle(
  //           fontFamily: 'PT-Sans',
  //           fontSize: 14,
  //           color: Colors.white,
  //         ),
  //       ),
  //       onPressed: () {},
  //     ),
  //   );
  // }

  Widget _buildRemeberMe() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
          checkColor: Colors.blue,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
        const Text(
          "Запам'ятати мене",
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'Створити акаунт',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: _onSignUpPressed,
      ),
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Вже зареєстровані? ",
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        InkWell(
          child: const Text(
            'Увійти',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onTap: widget.onSignInPressed,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.teal,
                Colors.teal,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ).copyWith(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Реєстрація',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Ім'я користувача",
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: "Введіть ім'я",
                    obscureText: false,
                    prefixedIcon: const Icon(Icons.mail, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: 'Введіть ваш email',
                    obscureText: false,
                    prefixedIcon: const Icon(Icons.mail, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Пароль',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: 'Введіть ваш пароль',
                    obscureText: true,
                    prefixedIcon: const Icon(Icons.lock, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (isWrongPassword)
                    Text(
                      'Неправильний пароль',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        color: Colors.amberAccent,
                      ),
                    ),

                  // _buildForgotPasswordButton(),
                  _buildRemeberMe(),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildSignUpButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   '- OR -',
                  //   style: TextStyle(
                  //     fontFamily: 'PT-Sans',
                  //     fontSize: 16,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // const Text(
                  //   'Sign in with',
                  //   style: TextStyle(
                  //     fontFamily: 'PT-Sans',
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // _buildSocialButtons(),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  _buildSignUpQuestion()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
