class Conversation{
  String? messageText;
  String? sentAt;
  bool? isMessageRead;
  String? sender;
  String? imageUrl;
  String? audio;
  int? type;

  Conversation({this.sentAt,this.isMessageRead,this.messageText,this.imageUrl,this.sender,this.type,this.audio});

  Conversation.formJson(json, id){
    this.messageText = json['messageText'];
    this.sentAt = json['sentAt'];
    this.isMessageRead = json['isMessageRead'];
    this.sender = json['sender'];
    this.imageUrl=json['imageUrl'];
    this.type=json["type"];
    this.audio=json["audio"];
  }

  toJson(){
    return {
      'messageText' : this.messageText,
      'sentAt' : this.sentAt,
      'isMessageRead' : this.isMessageRead,
      'sender' : this.sender,
      'imageUrl':this.imageUrl,
      'type':this.type,
      "audio":this.audio,
    };
  }

}