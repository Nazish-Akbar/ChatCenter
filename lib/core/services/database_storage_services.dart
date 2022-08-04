import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class DatabaseStorageServices{

  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(File image,String uuid) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("UserProfilesImages/$uuid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }

   Future<String?> uploadMessagesImg(File image,String uuid) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("MessageImg/${image.path}");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }



  Future<String?> uploadAudioToStorage(File audioFile,) async {
  try {
   
    var ref = FirebaseStorage.instance.ref().child('chatAudios/${DateTime.now().millisecondsSinceEpoch}');
    var uploadTask = ref.putFile(audioFile, ); 
    //  Uri downloadUrl = (await uploadTask.onComplete).uploadSessionUri;
    TaskSnapshot snapshot = (await uploadTask.whenComplete(  () => print('Voice Uploaded')  ));
      final url = snapshot.ref.getDownloadURL();


  print("url:$url");
  return  url;

  } catch (error) {
    print("error$error");
    return null;
  }

}



  Future<String?> uploadNotesImages(File image,String? xFile) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("notesImages/$xFile");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }


//   Future<dynamic> uploadAudioToStorage(dynamic audioFile) async {
//   try {
   
//     var ref = FirebaseStorage.instance.ref().child('chatAudios/${DateTime.now().millisecondsSinceEpoch}');
//     var uploadTask = ref.putFile(audioFile,); 
//      TaskSnapshot snapshot = await audioFile.whenComplete((print('voice Uploaded')));

//      final String url=snapshot.ref.getDownloadURL.toString();
//     //  Uri downloadUrl = (await uploadTask.onComplete).uploadSessionUri;
//    // var downloadUrl = (await uploadTask.whenComplete(() =>ref.getDownloadURL()));
//      // final String url = await downloadUrl.toString();


//   print("url:$url");
//   return  url;

//   } catch (error) {
//     print("error$error");
//     return null;
//   }

// }


}