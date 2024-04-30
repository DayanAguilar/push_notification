import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tercer_examen/main.dart';

class DataProvider {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken =await _firebaseMessaging.getToken();
    print(fCMToken.toString());
    initPushNotifications();
  }
  void handleMessage(RemoteMessage? message){
    if(message==null){
      return;
    }
    navigatorKey.currentState?.pushNamed(
      '/home',
    arguments: message,);
  }
  Future initPushNotifications() async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
