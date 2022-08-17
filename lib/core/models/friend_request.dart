class FriendRequestModel {
  String? senderName;
  String? senderId;
  String? senderDescription;
  String? senderImage;
  String? receiverId;
  int? type;

  DateTime? sentAt;

  FriendRequestModel(
      {this.senderName,
      this.senderId,
      this.receiverId,
      this.senderDescription,
      this.senderImage,
      this.type,
      this.sentAt});

  FriendRequestModel.fromJson(json, id) {
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.senderName = json['senderName'];
    this.type = json['type'];
    this.senderDescription = json['senderDescription'];
    this.senderImage = json['senderImage'];
    this.sentAt = json['sentAt'].toDate();
  }
  toJson() {
    return {
      'senderId': this.senderId,
      'type': this.type,
      'receiverId': this.receiverId,
      'senderName': this.senderName,
      'senderImage': this.senderImage,
      'senderDescription': this.senderDescription,
      'sentAt': this.sentAt,
    };
  }
}
