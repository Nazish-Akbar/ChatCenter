// class Person {
//   final title;
//   final subtile;
//   final image1;
//   Person(this.title, this.subtile, this.image1);
// }

// List<Person> personList = [
//   Person('Emaa Khan', 'this is subtitle', ''),
//   Person('Louis Pan', 'this is subtitle', ''),
//   Person('Codepreadtv', 'this is subtitle', ''),
//   Person('princeboy', 'this is subtitle', ''),
//   Person('AR Ban', 'this is subtitle', ''),
//   Person('Sehi sans', 'this is subtitle', ''),
//   Person('Sara bint', 'this is subtitle', ''),
//   Person('Vectoria', 'this is subtitle', ''),
// ];

class Persons {
  String? senderName;
  String? senderId;
  String? senderDescription;
  String? senderImage;
  String? receiverId;

  int? type;
  DateTime? sentAt;

  Persons(
      {this.senderName,
      this.senderId,
      this.receiverId,
      this.senderDescription,
      this.senderImage,
      this.sentAt,
      this.type});
  Persons.fromJson(json, id) {
    this.senderId = json['senderId'];
    this.receiverId = json['receiverId'];
    this.senderName = json['senderName'];
    this.type = json['type'];

    this.senderDescription = json['senderDescription'];
    this.senderImage = json['senderImage'] ?? "null";
    this.sentAt = json['sentAt']?.toDate() ?? DateTime.now();
  }
  toJson() {
    return {
      'senderId': this.senderId,
      'receiverId': this.receiverId,
      'senderName': this.senderName,
      'senderImage': this.senderImage,
      'senderDescription': this.senderDescription,
      'sentAt': this.sentAt,
      'type': this.type,
    };
  }

//TODO:: Complete class declaration by defining toJson(), fromJson()

}
