class FriendsModel {
  String? friendName;
  String? friendId;
  String? friendImage;
  String? senderId;
  int? type;
  String? receiverId;

  FriendsModel({
    this.senderId,
    this.receiverId,
    this.friendName,
    this.friendImage,
    this.friendId,
    this.type,
  });
  FriendsModel.fromJson(json, id) {
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.friendName = json['friendName'];
    this.friendId = json["friendId"];
    this.type = json["type"];
    this.friendImage = json['friendImage'] ?? "null";
  }
  toJson() {
    return {
      "friendId": this.friendId,
      'friendName': this.friendName,
      'friendImage': this.friendImage,
      'receiverId': this.receiverId,
      'senderId': this.senderId,
      'type': this.type,
    };
  }

//TODO:: Complete class declaration by defining toJson(), fromJson()

}
