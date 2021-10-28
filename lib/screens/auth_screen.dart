import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_project/screens/profile_screen.dart';
import 'package:test_project/store/auth/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthStore store = AuthStore();
  bool _passwordVisible = false;
  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => TextFormField(
                    keyboardType: TextInputType.phone,
                    onChanged: (_) =>
                        {store.setPhone(maskFormatter.getUnmaskedText())},
                    inputFormatters: [maskFormatter],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Номер телефона',
                      hintText: 'Введите номер телефона',
                      // errorText: store.error.phone,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => TextField(
                    obscureText: !_passwordVisible,
                    onChanged: (value) => store.setPassword(value),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Пароль',
                      hintText: 'Введите пароль',
                      // errorText: store.error.password,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: store.loading
                      ? ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey))
                      : null,
                  child: const Text('Войти'),
                  onPressed: store.loading ? null : store.loginUser,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Text('Забыл пароль?'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
