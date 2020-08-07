import 'package:flutter/material.dart';
import '../Backend/server.dart';

class MicroBlogComposer extends StatefulWidget {
  const MicroBlogComposer({Key key}) : super(key: key);

  @override
  _MicroBlogComposerState createState() => _MicroBlogComposerState();
}

class _MicroBlogComposerState extends State<MicroBlogComposer> {
  bool isFact = false;
  String content = "";

  void updateComment(x) {
    setState(() {
      content = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
            child: RaisedButton(
              onPressed: () => setState(() => isFact = !isFact),
              child: (isFact) ? Text("Fact") : Text("Opinion"),
              color: (isFact) ? Colors.green : Colors.red,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () async {
                print("Fact: $isFact");
                print(content);
                //upload
                String category = (isFact) ? "Fact" : "Opinion";
                await createMicroblog(content, category);
                Navigator.pushNamed(context, '/HomePage');
              },
              child: Text("Publish"),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ComposerComponent(contentUpdater: updateComment),
    );
  }
}

class ComposerComponent extends StatefulWidget {
  final contentUpdater;
  const ComposerComponent({this.contentUpdater});

  @override
  _ComposerComponentState createState() => _ComposerComponentState();
}

class _ComposerComponentState extends State<ComposerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Card(
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (x) {
                  widget.contentUpdater("$x");
                },
                maxLines: 1000,
                style: TextStyle(fontSize: 19.0),
                decoration:
                    InputDecoration.collapsed(hintText: "What's happening?"),
              ),
            )),
      ),
    ]);
  }
}
