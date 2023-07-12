import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStoryText(),
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStoryText(1);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      storyBrain.getStoryChoice1(),
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Visibility(
                  visible: storyBrain.isFVisiable(),
                  child: Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStoryText(2);
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        storyBrain.getStoryChoice2(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
