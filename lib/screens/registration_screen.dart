import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();

}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Имя',
                      hintText: 'Введите имя',
                      // errorText: store.error.phone,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Фамилия',
                      hintText: 'Введите фамилию',
                      // errorText: store.error.phone,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => {},
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
                    onChanged: (value) => {},
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
                width: 200,
                child: ElevatedButton(
                  child: const Text('Зарегистрироваться'),
                  onPressed: () {},
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 42),
                  child: Text('Вернуться назад'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
