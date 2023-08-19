part of components;

class Conversation extends StatefulWidget {
  final Function onTap;
  final String name;
  final String? imgUrl;
  final String message;
  final String time;
  final bool isMessageRead;

  Conversation(
      {required this.onTap,
      required this.name,
      this.imgUrl,
      required this.message,
      required this.time,
      required this.isMessageRead});

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.width * 0.02),
        child: Row(children: [
          widget.imgUrl == null
              ? DefualtAvatar(firstName: widget.name, lastName: "Tadege")
              : CircleAvatar(
                  backgroundImage: NetworkImage(widget.imgUrl!),
                  maxRadius: size.height * 0.02,
                ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: widget.isMessageRead
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          )),
          Text(
            widget.time,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 12,
                fontWeight:
                    widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
          ),
        ]),
      ),
    );
  }
}
