class RecipeModel {
  late String author;
  late String title;
  late String category;
  late String duration;
  late String imgAuthor;
  late String imgCover;
  late bool favorite;

  RecipeModel({
    required this.author,
    required this.title,
    required this.category,
    required this.duration,
    required this.imgAuthor,
    required this.imgCover,
    required this.favorite,
  });

  RecipeModel.fromJson(Map<String, dynamic> json) {
    author = json['author'].toString();
    title = json['title'].toString();
    category = json['category'].toString();
    duration = json['duration'].toString();
    imgAuthor = json['img_author'].toString();
    imgCover = json['img_cover'].toString();
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['category'] = this.category;
    data['duration'] = this.duration;
    data['img_author'] = this.imgAuthor;
    data['img_cover'] = this.imgCover;
    data['favorite'] = this.favorite;
    return data;
  }

  // static List<RecipeModel> fromJsonList(List list) {
  //   if (list == null) return null;
  //   return list.map((item) => RecipeModel.fromJson(item)).toList();
  // }
}
