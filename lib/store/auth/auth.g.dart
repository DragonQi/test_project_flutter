// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$phoneAtom = Atom(name: '_AuthStore.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStore.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userDataAtom = Atom(name: '_AuthStore.userData');

  @override
  dynamic get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(dynamic value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  final _$loginUserAsyncAction = AsyncAction('_AuthStore.loginUser');

  @override
  Future<http.Response> loginUser() {
    return _$loginUserAsyncAction.run(() => super.loginUser());
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void setPhone(dynamic value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phone: ${phone},
password: ${password},
userData: ${userData}
    ''';
  }
}
