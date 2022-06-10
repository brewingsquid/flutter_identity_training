import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        storyTitle: 'choose gender please', choice1: 'female', choice2: 'male'),
    Story(storyTitle: 'pick your name boy...', choice1: 'Jon', choice2: 'Bob'),
    Story(
        storyTitle: 'pick your name girl...', choice1: 'Jane', choice2: 'Beth'),
    Story(storyTitle: 'Hey, Bob!', choice1: 'ehmm that\'s not me', choice2: ''),
    Story(
        storyTitle: 'What\'s uppp, Jon!',
        choice1: 'let\'s do it again!',
        choice2: ''),
    Story(
        storyTitle: 'Hello, Beth!',
        choice1: 'wohoo, that was fun!',
        choice2: ''),
    Story(
        storyTitle: 'Jane, nice to see you!',
        choice1: 'ok, nice...',
        choice2: ''),
    Story(storyTitle: '', choice1: '', choice2: ''),
    Story(storyTitle: '', choice1: '', choice2: ''),
    Story(storyTitle: '', choice1: '', choice2: ''),
    Story(storyTitle: '', choice1: '', choice2: ''),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  int getStoryNumber() {
    return _storyNumber;
  }

  int _storyNumber = 0;

  void restart() {
    _storyNumber = 0;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 6;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 4;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber >= 3 && choiceNumber == 1) {
      restart();
    }
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber <= 2) {
      return true;
    } else {
      return false;
    }
  }
}
