// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonController, Store {
  final _$statusAtom = Atom(name: '_PokemonController.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAtom = Atom(name: '_PokemonController.list');

  @override
  ObservableList<Pokemon> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Pokemon> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_PokemonController.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
