/// This allows our `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
class HTTPResultEntity<T> {
  bool error;
  T results;

  HTTPResultEntity.fromJson(Map<String, dynamic> json)
      : error = json["error"],
        results = json["results"];
}

class GirlEntity {
  String url;

  GirlEntity(this.url);
}
