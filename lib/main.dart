import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain story = StoryBrain();

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    story.getStory(),
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      story.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    story.getChoice1(),
                    style: TextStyle(
                      fontSize: 17.0,
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
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        story.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      story.getChoice2(),
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  visible: story.buttonShouldBeVisible(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
