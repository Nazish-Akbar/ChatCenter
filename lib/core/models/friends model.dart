class Friends {
  String? friendName;

  String? friendImage;

  Friends({
    this.friendName,
    this.friendImage,
  });
  Friends.fromJson(json, id) {
    this.friendName = json['friendName'];

    this.friendImage = json['friendImage'] ?? "null";
  }
  toJson() {
    return {
      'friendName': this.friendName,
      'friendImage': this.friendImage,
    };
  }

//TODO:: Complete class declaration by defining toJson(), fromJson()

}
