class Conversation{
  String? messageText;
  String? sentAt;
  bool? isMessageRead;
  String? sender;
  String? imageUrl;
  String? voiceNote;
  int? type;

  Conversation({this.sentAt,this.isMessageRead,this.messageText,this.imageUrl,this.sender,this.type,this.voiceNote});

  Conversation.formJson(json, id){
    this.messageText = json['messageText'];
    this.sentAt = json['sentAt'];
    this.isMessageRead = json['isMessageRead'];
    this.sender = json['sender'];
    this.imageUrl=json['imageUrl'];
    this.type=json["type"];
    this.voiceNote=json["voiceNote"];
  }

  toJson(){
    return {
      'messageText' : this.messageText,
      'sentAt' : this.sentAt,
      'isMessageRead' : this.isMessageRead,
      'sender' : this.sender,
      'imageUrl':this.imageUrl,
      'type':this.type,
      "voiceNote":this.voiceNote,
    };
  }

}