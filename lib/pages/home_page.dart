import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        centerTitle: true,
        title: Text(
          'Join Video Conferrence Room',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 210),
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Container(
            alignment: Alignment.center,
            height: 200,
            child: ChatRoomForm(),
          ),
        ),
      ),
    );
  }
}

class ChatRoomForm extends StatefulWidget {
  ChatRoomForm({Key? key}) : super(key: key);

  @override
  State<ChatRoomForm> createState() => _ChatRoomFormState();
}

class _ChatRoomFormState extends State<ChatRoomForm> {
  final _formKey = GlobalKey<FormState>();
  late String roomCode;

  joinVideoConferrencingRoom() async {
    String serverUrl;
    if (_formKey.currentState!.validate()) {
      serverUrl = "https://meet.jit.si";

      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };

      if (!kIsWeb) {
        // Here is an example, disabling features for each platform
        if (Platform.isAndroid) {
          // Disable ConnectionService usage on Android to avoid issues (see README)
          featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        } else if (Platform.isIOS) {
          // Disable PIP on iOS as it looks weird
          featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
        }
      }

      // Define meetings options here
      var options = JitsiMeetingOptions(room: roomCode)
        ..serverURL = serverUrl
        ..featureFlags.addAll(featureFlags);

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(options,
          listener: JitsiMeetingListener(
              onConferenceWillJoin: (message) {
                debugPrint("${options.room} will join with message: $message");
              },
              onConferenceJoined: (message) {
                debugPrint("${options.room} joined with message: $message");
              },
              onConferenceTerminated: (message) {
                debugPrint("${options.room} terminated with message: $message");
              },
              genericListeners: [
                JitsiGenericListener(
                    eventName: 'readyToClose',
                    callback: (dynamic message) {
                      debugPrint("readyToClose callback");
                    })
              ]));
    } else {
      print("please enter some code to join");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 90.0, right: 90),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Enter Secret Code"),
              onChanged: (val) {
                roomCode = val;
                print(val);
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "cant't be empty!";
                } else {
                  val = "";
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  joinVideoConferrencingRoom();
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(29)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.video_camera,
                            size: 36,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "Join",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ])),
              ),
              SizedBox(
                width: 19,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Share.share("$roomCode");
                  } else {
                    // ignore: avoid_print
                    print("Please provide some room code");
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(29)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
