class Product{
  final String id;
  final String name;
  final String description;
  final String tag;
  final String price;
  final String image;
  final String created_at;
  final String updated_at;

  Product(this.id, this.name, this.description, this.tag, this.price, this.image, this.created_at, this.updated_at);
  Product.fromJson(Map<String, dynamic>json):
        id=json["id"],
        name=json["name"],
        description=json["description"],
        tag=json["tag"],
        price=json["price"],
        image=json["image"],
        created_at=json["created_at"],
        updated_at=json["updated_at"];
  Map<String,dynamic> toJson()=>{
    "id":id,
    "name":name,
    "description":description,
    "tag":tag,
    "price":price,
    "image":image,
    "created_at":created_at,
    "updated_at":updated_at
  };
}