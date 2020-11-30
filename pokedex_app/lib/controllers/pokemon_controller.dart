import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/app_status.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/models/response_model.dart';
import 'package:pokedex_app/repositories/pokemons_repository.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonController with _$PokemonController;

abstract class _PokemonController with Store {

  PokemonsRepository _repository;

  _PokemonController(){
    _repository = new PokemonsRepository();
    _init();
  }

  _init() async {
    getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Pokemon> list = new ObservableList<Pokemon>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      final allList = await _repository.getData();
      list.clear();
      list.addAll(allList);
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error..value = e;
    }
  }


}