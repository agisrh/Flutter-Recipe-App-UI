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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['category'] = category;
    data['duration'] = duration;
    data['img_author'] = imgAuthor;
    data['img_cover'] = imgCover;
    data['favorite'] = favorite;
    return data;
  }

  // static List<RecipeModel> fromJsonList(List list) {
  //   if (list == null) return null;
  //   return list.map((item) => RecipeModel.fromJson(item)).toList();
  // }
}
