import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/models/response_model.dart';

class PokemonsRepository {
  var url = "https://pokeapi.co/api/v2/pokemon";
  ResponsePokemons pokemons = new ResponsePokemons();
  List<Pokemon> listData = new List<Pokemon>();

  Future<ResponsePokemons> getAll() async {
    final response = await http.get(url);
    switch (response.statusCode) {
      case 200:
        Map data = jsonDecode(response.body);
        print('PokemonsRepository - Response: Code 200');
        return ResponsePokemons.fromJson(data);        
        break;
      case 401:
        print('PokemonsRepository - Response: Code 401');
        break;
      default:
        print('PokemonsRepository - Response: Code 500');
    }
  }

  Future<List<Pokemon>> getData() async {
    final responseData= await getAll();
    List<Pokemons> pokemons = responseData.pokemons;
    for(int i = 0; i < pokemons.length; i++){
      final url = pokemons[i].url;
      final response = await http.get(url);
      if(response.statusCode == 200){
        Map data = jsonDecode(response.body);
        print(url+' - Response: Code 200');
        final pokemonData = Pokemon.fromJson(data);
        listData.add(pokemonData);
      }
      else {
        print(url+' - Response: Code '+response.statusCode.toString());
      }
    }
    return listData;
  }
}
