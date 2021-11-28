import 'package:flutter/material.dart';

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
          'Join Room',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 120),
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

class ChatRoomForm extends StatelessWidget {
  ChatRoomForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late String roomCode;

  joinVideoConferrencingRoom() {
    if (_formKey.currentState!.validate()) {
    } else {
      print("Please provide some room code");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 110.0, right: 110),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Enter Secret Code"),
              onChanged: (val) {
                roomCode = val;
                print(val);
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field Cant't be empty!";
                } else {
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
                  child: Text(
                    "Join",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                width: 19,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(29)),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    "Share",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
