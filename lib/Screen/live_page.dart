import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;

  const LivePage({Key? key, required this.liveID, this.isHost = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserInfo(),
      builder: (context, AsyncSnapshot<UserInfo> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Or any loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return SafeArea(
            child: ZegoUIKitPrebuiltLiveStreaming(
              appID:
                  614658191, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
              appSign:
                  "d35c2212688f7e3d5d70b85745c7ef910263bd6ecd0a76091f6472de74fb2c2f", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
              userID: snapshot.data!.userID,
              userName: snapshot.data!.userName,
              liveID: liveID,
              config: isHost
                  ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                  : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
            ),
          );
        }
      },
    );
  }

  Future<UserInfo> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('userID');
    String? userName = prefs.getString('userName');

    if (userID == null || userName == null) {
      userID = _generateUserID();
      userName = _generateUserName();
      await prefs.setString('userID', userID);
      await prefs.setString('userName', userName);
    }

    return UserInfo(userID!, userName!);
  }

  String _generateUserID() {
    // Implement your logic to generate a unique userID here
    // You can use UUID or any other method to ensure uniqueness
    return 'user_${DateTime.now().millisecondsSinceEpoch}';
  }

  String _generateUserName() {
    // Implement your logic to generate a unique userName here
    // You can use random names or any other method to ensure uniqueness
    return 'User ${DateTime.now().millisecondsSinceEpoch}';
  }
}

class UserInfo {
  final String userID;
  final String userName;

  UserInfo(this.userID, this.userName);
}
