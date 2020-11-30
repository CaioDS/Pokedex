class ResponsePokemons {

  List<Pokemons> pokemons;

  ResponsePokemons({this.pokemons});

  ResponsePokemons.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      pokemons = new List<Pokemons>();
      json['results'].forEach((v) {
        pokemons.add(new Pokemons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemons != null) {
      data['results'] = this.pokemons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemons {
  String name;
  String url;

  Pokemons({this.name, this.url});

  Pokemons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}