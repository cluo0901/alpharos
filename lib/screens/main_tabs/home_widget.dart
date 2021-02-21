import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "https://ak6.picdn.net/shutterstock/videos/6982306/thumb/1.jpg",
  "https://ak6.picdn.net/shutterstock/videos/6982306/thumb/1.jpg",
  "https://ak6.picdn.net/shutterstock/videos/6982306/thumb/1.jpg",
  "https://ak6.picdn.net/shutterstock/videos/6982306/thumb/1.jpg",
];

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _current = 0;

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
              ),
            ),
          ))
      .toList();

  final ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          // Caoursel banner
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]),
        // Following user icons -> go to profiles
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
          height: 0,
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        // Retrieve posts
        StreamBuilder(
          stream: ref.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return GestureDetector(
                      onTap: () {
                        print('tapped');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => EditNote(noteToEdit: document)));
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Icon(
                                  Icons.person), //avatar of the followed user
                              shape: CircleBorder(),
                            ),
                            title: Text(
                                'username@id ${document.data()['timestamp']}'),
                            subtitle: Text(
                              document.data()['content'],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {},
                            ),
                          ),
                          Row(
                            children: [
                              FlatButton.icon(
                                icon: Icon(Icons.chat_bubble_outline_rounded),
                                label: Text('4'),
                                onPressed: () {},
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.restore_page_outlined),
                                label: Text('4'),
                                onPressed: () {},
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.favorite_outline_rounded),
                                label: Text('4'),
                                onPressed: () {},
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.share_outlined),
                                label: Text('4'),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
