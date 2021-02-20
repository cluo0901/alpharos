import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Recommended'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                child: Icon(Icons.person), //avatar of the followed user
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        Text('Trending Topics'),
        ListTile(
          leading: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: Icon(Icons.person), //avatar of the followed user
            shape: CircleBorder(),
          ),
          title: Text('title'),
          subtitle: Text('subtitle'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: Icon(Icons.person), //avatar of the followed user
            shape: CircleBorder(),
          ),
          title: Text('title'),
          subtitle: Text('subtitle'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
