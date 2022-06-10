import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int faceNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/background.png'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CircleAvatar(
                radius: 150.0,
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('images/avatar$faceNumber.png'),
              ),
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 30.0,
                      color: Colors.blueGrey.shade100,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                      if (storyBrain.getStoryNumber() >= 3) {
                        faceNumber = storyBrain.getStoryNumber();
                      } else {
                        faceNumber = 0;
                      }
                      print(storyBrain.getStoryNumber());
                    });
                  },
                  color: Colors.teal,
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                        if (storyBrain.getStoryNumber() >= 3) {
                          faceNumber = storyBrain.getStoryNumber();
                        } else {
                          faceNumber = 0;
                        }
                        print(storyBrain.getStoryNumber());
                      });
                    },
                    color: Colors.teal,
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
