class Pokemon {
  int id;
  String name;
  Image images = Image();

  Pokemon({ this.id, this.name, this.images });

  Pokemon.fromJson(Map<String, dynamic> json) 
    : id = json['id'] as int ?? '',
      name = json['name'] as String ?? '',
      images = Image.fromJson(json['sprites'] as Map) ?? Image ();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'sprites': images
  };

  @override
  String toString() => this.toJson().toString();

 }

class Image {
  String back;
  String front;

  Image({ this.back, this.front });

  Image.fromJson(Map<String, dynamic> json)
    : back = json == null ? '' : json['back_default'],
      front = json == null ? '' : json['front_default'];

  Map<String, dynamic> toJson() => 
    { 'back_default': back, 'front_default': front };

  @override
  String toString() => this.toJson().toString();

}