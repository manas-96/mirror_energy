class ArticleModel{
  final String id;
  final String title;
  final String short_description;
  final String content;
  final String image;
  final String created_at;
  final String updated_at;

  ArticleModel(this.id, this.title, this.short_description, this.content, this.image, this.created_at, this.updated_at);

  ArticleModel.fromJson(Map<String,dynamic>json):
  id=json["id"],
  title=json["title"],
  short_description=json["short_description"],
  content=json["content"],
  image=json["image"],
  created_at=json["created_at"],
  updated_at=json["updated_at"];
  Map<String,dynamic>toJson()=>{
    "id":id,
    "title":title,
    "short_description":short_description,
    "content":content,
    "image":image,
    "created_at":created_at,
    "updated_at":updated_at
  };
}