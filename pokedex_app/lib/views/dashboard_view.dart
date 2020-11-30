import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/util/loading_widget.dart';

class DashboardView extends StatefulWidget {
  DashboardView({ Key key }) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with SingleTickerProviderStateMixin {
  final _pokemonController = new PokemonController();
  List<Pokemon> _pokemons = new List<Pokemon>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pokemonController.getAll().then((data) {
        setState(() {
          _pokemons = _pokemonController.list;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("PokeDEX - Dashboard", style: TextStyle(color: Colors.grey),),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Color(0xfffffde0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35),
              child: Text("Todos os Pokemons", style: TextStyle(color: Colors.grey, fontSize: 25),),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, top: 30),
              child: Expanded(
                child: Divider(
                  indent: 110,
                  endIndent: 110,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 550,
              width: 400,
              child: _pokemons.isEmpty ? LoadingWidget() : _buildAllPokemons(_pokemons),
            ),
          ],
        ),
      ),
    );
  }

  _buildAllPokemons(List<Pokemon> _list) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(_list.length, (index) {
        return _buildCardPokemons(_list[index]);
      }),
    );
  }

  _buildCardPokemons(Pokemon pokemon) {
    return Card(
      elevation: 5,
      color: Color(0xfffff77a),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: OptimizedCacheImage(
                    height: 150,
                    width: 300,
                    imageUrl: pokemon.images.front,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 800,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pokemon.name, style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }


}

