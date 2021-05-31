class Album {
  int userId;
  int id;
  String title;
  Album({this.id,this.userId,this.title});

  factory Album.fromJson(Map<String, dynamic> json){
   return Album(
      id:json['id'],
      userId: json['userId'],
     title:json['title']
    );
  }
}