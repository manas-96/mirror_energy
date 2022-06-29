
class ContentModel{
  final String id;
  final String title;
  final String content;
  final String image;
  final String created_at;
  final String updated_at;
  ContentModel(this.id, this.title, this.content, this.image, this.created_at, this.updated_at);

  ContentModel.fromJson(Map<String,dynamic>json):
        id=json["id"],
        title=json["title"],
        content=json["content"],
        image=json["image"],
        created_at=json["created_at"],
        updated_at=json["updated_at"];
  Map<String,dynamic>toJson()=>{
    "id":id,
    "title":title,
    "content":content,
    "image":image,
    "created_at":created_at,
    "updated_at":updated_at
  };
}
