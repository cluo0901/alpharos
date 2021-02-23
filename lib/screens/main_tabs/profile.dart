import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String displayUserUid;

  Profile({this.displayUserUid});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  final ref = FirebaseFirestore.instance.collection('posts');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = _auth.currentUser;
    final uid = user.uid;

    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            // title: Icon(Icons.person),
            // centerTitle: true,
            floating: true,
            pinned: true,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: Stack(
              children: <Widget>[
                // Positioned.fill(
                //   child: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/avatar.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Luo Chao@cluo0901'),
                              Text('6 Following 2 Followers'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 13.0),
                child: OutlineButton(
                    borderSide: BorderSide(color: Colors.blue),
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                    child: Text(
                      (uid == widget.displayUserUid ||
                              widget.displayUserUid == 'user')
                          ? 'Edit profile'
                          : 'Follow',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.blue,
              indicatorColor: Colors.blue[700],
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Posts',
                ),
                Tab(
                  text: 'replies',
                ),
                Tab(
                  text: 'media',
                ),
                Tab(
                  text: 'likes',
                ),
              ],
            ),
          )
        ];
      },
      body: TabBarView(controller: _tabController, children: [
        // new Text("My posts"),
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
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              child: Icon(Icons.person),
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
        new Text("This is chat Tab View"),
        new Text("This is notification Tab View"),
        new Text("This is notification Tab View"),
      ]),
    );

    // double screenSize = MediaQuery.of(context).size.width;
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 50.0,
    //         width: screenSize,
    //         child: const DecoratedBox(
    //           decoration: const BoxDecoration(color: Colors.blue),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 20.0,
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Column(
    //             children: [
    //               MaterialButton(
    //                 onPressed: () {},
    //                 color: Colors.blue,
    //                 child: Icon(Icons.person),
    //                 shape: CircleBorder(),
    //               ),
    //               Text('Luo Chao'),
    //               Text('@cluo0901'),
    //               Text('Singapore Joined April 2015'),
    //               Text('6 Following 2 Followers')
    //             ],
    //           ),
    //           OutlineButton(
    //               borderSide: BorderSide(color: Colors.blue),
    //               onPressed: () {
    //                 Navigator.pushNamed(context, '/edit_profile');
    //               },
    //               child: Text(
    //                 'Edit profile',
    //                 style: TextStyle(
    //                   color: Colors.blue,
    //                 ),
    //               ),
    //               shape: new RoundedRectangleBorder(
    //                   borderRadius: new BorderRadius.circular(30.0))),
    //         ],
    //       ),
    //       TabBar(
    //         labelColor: Colors.blue,
    //         indicatorColor: Colors.blue[700],
    //         unselectedLabelColor: Colors.grey,
    //         controller: _tabController,
    //         tabs: [
    //           Tab(
    //             text: 'Posts',
    //           ),
    //           Tab(
    //             text: 'replies',
    //           ),
    //           Tab(
    //             text: 'media',
    //           ),
    //           Tab(
    //             text: 'likes',
    //           ),
    //         ],
    //       ),
    //       Container(
    //         height: 20000.0,
    //         child: TabBarView(
    //           controller: _tabController,
    //           children: [
    //             // new Text("My posts"),
    //             StreamBuilder(
    //               stream: ref.snapshots(),
    //               builder: (BuildContext context,
    //                   AsyncSnapshot<QuerySnapshot> snapshot) {
    //                 if (snapshot.hasData) {
    //                   return Expanded(
    //                     child: ListView(
    //                       children: snapshot.data.docs
    //                           .map((DocumentSnapshot document) {
    //                         return GestureDetector(
    //                           onTap: () {
    //                             print('tapped');
    //                           },
    //                           child: Column(
    //                             children: [
    //                               ListTile(
    //                                 leading: MaterialButton(
    //                                   onPressed: () {},
    //                                   color: Colors.blue,
    //                                   child: Icon(Icons.person),
    //                                   shape: CircleBorder(),
    //                                 ),
    //                                 title: Text(
    //                                     'username@id ${document.data()['timestamp']}'),
    //                                 subtitle: Text(
    //                                   document.data()['content'],
    //                                   style: TextStyle(
    //                                     fontSize: 18.0,
    //                                     color: Colors.black,
    //                                   ),
    //                                 ),
    //                                 trailing: IconButton(
    //                                   icon: Icon(Icons.more_horiz),
    //                                   onPressed: () {},
    //                                 ),
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   FlatButton.icon(
    //                                     icon: Icon(
    //                                         Icons.chat_bubble_outline_rounded),
    //                                     label: Text('4'),
    //                                     onPressed: () {},
    //                                   ),
    //                                   FlatButton.icon(
    //                                     icon: Icon(Icons.restore_page_outlined),
    //                                     label: Text('4'),
    //                                     onPressed: () {},
    //                                   ),
    //                                   FlatButton.icon(
    //                                     icon: Icon(
    //                                         Icons.favorite_outline_rounded),
    //                                     label: Text('4'),
    //                                     onPressed: () {},
    //                                   ),
    //                                   FlatButton.icon(
    //                                     icon: Icon(Icons.share_outlined),
    //                                     label: Text('4'),
    //                                     onPressed: () {},
    //                                   ),
    //                                 ],
    //                               )
    //                             ],
    //                           ),
    //                         );
    //                       }).toList(),
    //                     ),
    //                   );
    //                 } else {
    //                   return CircularProgressIndicator();
    //                 }
    //               },
    //             ),
    //             new Text("This is chat Tab View"),
    //             new Text("This is notification Tab View"),
    //             new Text("This is notification Tab View"),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
