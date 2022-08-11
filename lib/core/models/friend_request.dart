class FriendRequestModel {
  String? senderName;
  String? senderId;
  String? senderDescription;
  String? senderImage;
  String? receiverId;

  DateTime? sentAt;

  FriendRequestModel(
      {this.senderName,
      this.senderId,
      this.receiverId,
      this.senderDescription,
      this.senderImage,
      this.sentAt});

  FriendRequestModel.fromJson(json, id) {
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.senderName = json['senderName'];

    this.senderDescription = json['senderDescription'];
    this.senderImage = json['senderImage'];
    this.sentAt = json['sentAt'].toDate();
  }
  toJson() {
    return {
      'senderId': this.senderId,
      'receiverId': this.receiverId,
      'senderName': this.senderName,
      'senderImage': this.senderImage,
      'senderDescription': this.senderDescription,
      'sentAt': this.sentAt,
    };
  }
}
