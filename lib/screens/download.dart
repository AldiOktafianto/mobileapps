import 'package:flutter/material.dart';
import 'package:netflix_/models/model.dart';
import 'package:provider/provider.dart';
import '../widgets/circular_clipper.dart';


class download_screen extends StatefulWidget {
  const download_screen({Key key}) : super(key: key);

  @override
  State<download_screen> createState() => _download_screenState();
}

class _download_screenState extends State<download_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LibraryServices>(
        builder: (context, services, child) {
          return ListView.builder(
            itemCount: services.defaultList.length,
              itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          child: Hero(
                            tag: services.defaultList[index].imageUrl,
                            child: ClipShadowPath(
                              clipper: CircularClipper(),
                              shadow: Shadow(blurRadius: 20.0),
                              child: Image(
                                height: 400.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: AssetImage(services.defaultList[index].imageUrl),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(left: 30.0),
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                            ),
                            Image(
                              image: AssetImage('assets/images/netflix_logo.png'),
                              height: 60.0,
                              width: 150.0,
                            ),
                            IconButton(
                              padding: EdgeInsets.only(left: 30.0),
                              onPressed: () {
                                services.deleteListener(services.defaultList[index], context);
                              },
                              icon: Icon(Icons.favorite_border),
                              iconSize: 30.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Positioned.fill(
                          bottom: 10.0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RawMaterialButton(
                              padding: EdgeInsets.all(10.0),
                              elevation: 12.0,
                              onPressed: () => print('Play Video'),
                              shape: CircleBorder(),
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.play_arrow,
                                size: 60.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 20.0,
                          child: IconButton(
                            onPressed: () => print('Add to My List'),
                            icon: Icon(Icons.add),
                            iconSize: 40.0,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 25.0,
                          child: IconButton(
                            onPressed: () => print('Share'),
                            icon: Icon(Icons.share),
                            iconSize: 35.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(height: 10.0),

                          SizedBox(height: 12.0),

                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[

                                  SizedBox(height: 2.0),

                                ],
                              ),
                              Column(
                                children: <Widget>[

                                  SizedBox(height: 2.0),

                                ],
                              ),
                              Column(
                                children: <Widget>[

                                  SizedBox(height: 2.0),

                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            height: 120.0,
                            child: SingleChildScrollView(

                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
          );
        },
      ),
    );
  }
}
