import 'package:firebase_chat/cubit/fetch_conversation_message_cubit/index.dart';
import 'package:firebase_chat/components/index.dart';
import 'package:firebase_chat/resources/firestore_service.dart';
import 'package:firebase_chat/screens/chat_detail_screen/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirestoreService firestoreService = FirestoreService();
  List users = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firestoreService.getAllUsers().then((value) {
        if (value != null) {
          print(value);
          setState(() {
            users = value;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<FetchConversationMessageCubit>(context));
    return Scaffold(
      body: BlocConsumer<FetchConversationMessageCubit,
              FetchConversationMessageState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Conversations",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontSize: 28)),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, top: 2, bottom: 2),
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.pink[50],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.add,
                                      color: Colors.pink,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "Add New",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: users.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Conversation(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatDetailPage(
                                              name: users[index].firstName,
                                              imgUrl: '',
                                            )));
                              },
                              name: users[index].firstName,
                              imgUrl: "",
                              message: "Sewoch endet nachihu",
                              time: "Today",
                              isMessageRead: false);
                        })
                  ]),
            );
          }),
    );
  }
}
