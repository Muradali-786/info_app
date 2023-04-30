class Api {
  final String api;
  final String description;
  final String auth;
  final bool https;
  final String cors;
  final String link;
  final String category;

  Api({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      api: json['API'],
      description: json['Description'],
      auth: json['Auth'],
      https: json['HTTPS'],
      cors: json['Cors'],
      link: json['Link'],
      category: json['Category'],
    );
  }
}
