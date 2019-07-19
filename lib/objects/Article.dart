class Article {

  String title, desc;
  List images;
  bool forsale;

  Article({this.title, this.desc, this.images, this.forsale});

  factory Article.fromJson(Map json) {
    return Article(
      title: json['title'],
      desc: json['desc'],
      images: json['images'],
      forsale: json['forsale'] 
    );
  }

}