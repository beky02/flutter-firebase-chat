import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String imgUrl;
  final String connectionId;

  const ChatDetailPage(
      {@required this.name, @required this.imgUrl, this.connectionId});
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            child: Row(children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 0),
              CircleAvatar(
                // backgroundImage: NetworkImage(widget.imgUrl),
                maxRadius: 22,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
              ),
              itemBuilder: (context, index) {
                return Align(
                    alignment: index % 2 != 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: index % 2 != 0
                              ? Colors.grey.shade200
                              : Colors.blue[200],
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "creating-a-route-calculator",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ));
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02, vertical: size.width * 0.01),
                child: Row(
                  children: [
                    SizedBox(width: size.width * 0.03),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write a message . . . ",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        
                      },
                      child: Icon(
                        Icons.send,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
