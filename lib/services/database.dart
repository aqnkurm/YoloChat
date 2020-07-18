import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return Firestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .getDocuments();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData){

    Firestore.instance.collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
    
    /*******Robin*********/
    /*
    THIS IS JUST SUDO CODE NOT SYNTAX CORRECT
    //You added the message to the DB, now you just need to notify the other person
    // You probably want to have this function declarion...
    
    Future<void> addMessage(String chatRoomId, userId, chatMessageData){
                                               ^^^  
    // Get all the user IDs in the chatroom
    usersInChatroom = Firestore.instance.collection("chatroom")
      .document(chatRoomId)
      .collection("users")
      .orderBy("whocares")
      .snapshots()
      
     // for each user in chatroom, if not the sending user, then send a notification
     usersInChatroom.forEach((user_element) => {
       if(user_element != user) {
          // need to write this function
          sendNotification(String chatRoomId, user_element, chatMessageData) // You would need to just right this function that handles the act of delivering a notification
                                                                             // chatRoomId      --> Name of chatroom for notification
                                                                             // user_element    --> Id of user to deliver too
                                                                             // chatMessageData --> Message to display in notification
       }
     })
    */
    
  }

  getUserChats(String itIsMyName) async {
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}
