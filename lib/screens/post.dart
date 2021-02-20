import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(''),
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'content': content.text,
                  'timestamp': DateTime.now(),
                });
                Navigator.pop(context);
              },
              child: Text('Post'))
        ],
      ),
      body: Row(
        children: [
          MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: Icon(Icons.person), //avatar of the followed user
            shape: CircleBorder(),
          ),
          Expanded(
            child: TextField(
              controller: content,
              decoration: InputDecoration(labelText: 'What are you investing?'),
            ),
          ),
        ],
      ),
    );
  }
}
