import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(
    MaterialApp(
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) => MyApp());
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Initialize the audio player

  // Define a function that will play the audio file
  void playAudioFile(audioPath) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(audioPath),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Learning App',
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Language Learning App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Way to Learn Japanese',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NumbersScreen(playAudioFile)),
                  );
                },
                child: Text('Numbers'),
              ),
              SizedBox(height: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FamilyMembersScreen(playAudioFile)),
                  );
                },
                child: Text('Family Members'),
              ),
              SizedBox(height: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorsScreen(playAudioFile)),
                  );
                },
                child: Text('Colors'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumbersScreen extends StatelessWidget {
  final Function playAudioFile;

  NumbersScreen(this.playAudioFile);

  // Define the list of numbers
  final List<Map<String, dynamic>> numbers = [
    {
      'name': 'One',
      'image': 'assets/images/numbers/number_one.png',
      'audio': 'assets/sounds/numbers/number_one_sound.mp3'
    },
    {
      'name': 'Two',
      'image': 'assets/images/numbers/number_two.png',
      'audio': 'assets/sounds/numbers/number_two_sound.mp3'
    },
    {
      'name': 'Three',
      'image': 'assets/images/numbers/number_three.png',
      'audio': 'assets/sounds/numbers/number_three_sound.mp3'
    },
    {
      'name': 'Four',
      'image': 'assets/images/numbers/number_four.png',
      'audio': 'assets/sounds/numbers/number_four_sound.mp3'
    },
    {
      'name': 'Five',
      'image': 'assets/images/numbers/number_five.png',
      'audio': 'assets/sounds/numbers/number_five_sound.mp3'
    },
    {
      'name': 'Six',
      'image': 'assets/images/numbers/number_six.png',
      'audio': 'assets/sounds/numbers/number_six_sound.mp3'
    },
    {
      'name': 'Seven',
      'image': 'assets/images/numbers/number_seven.png',
      'audio': 'assets/sounds/numbers/number_seven_sound.mp3'
    },
    {
      'name': 'Eight',
      'image': 'assets/images/numbers/number_eight.png',
      'audio': 'assets/sounds/numbers/number_eight_sound.mp3'
    },
    {
      'name': 'Nine',
      'image': 'assets/images/numbers/number_nine.png',
      'audio': 'assets/sounds/numbers/number_nine_sound.mp3'
    },
    {
      'name': 'Ten',
      'image': 'assets/images/numbers/number_ten.png',
      'audio': 'assets/sounds/numbers/number_ten_sound.mp3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(1),
        itemCount: numbers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              playAudioFile(numbers[index]['audio']);
            },
            child: Column(
              children: [
                Image.asset(
                  numbers[index]['image'],
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 1),
                Text(numbers[index]['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FamilyMembersScreen extends StatelessWidget {
  final Function playAudioFile;

  FamilyMembersScreen(this.playAudioFile);

  // Define the list of family members
  final List<Map<String, dynamic>> familyMembers = [
    {
      'name': 'Son',
      'image': 'assets/images/family_members/family_son.png',
      'audio': 'assets/sounds/family_members/son.wav',
    },
    {
      'name': 'Daughter',
      'image': 'assets/images/family_members/family_daughter.png',
      'audio': 'assets/sounds/family_members/daughter.wav',
    },
    {
      'name': 'Father',
      'image': 'assets/images/family_members/family_father.png',
      'audio': 'assets/sounds/family_members/father.wav',
    },
    {
      'name': 'Mother',
      'image': 'assets/images/family_members/family_mother.png',
      'audio': 'assets/sounds/family_members/mother.wav',
    },
    {
      'name': 'Grandfather',
      'image': 'assets/images/family_members/family_grandfather.png',
      'audio': 'assets/sounds/family_members/grandfather.wav',
    },
    {
      'name': 'Grandmother',
      'image': 'assets/images/family_members/family_grandmother.png',
      'audio': 'assets/sounds/family_members/grandmother.wav',
    },
    {
      'name': 'Older Brother',
      'image': 'assets/images/family_members/family_older_brother.png',
      'audio': 'assets/sounds/family_members/olderbrother.wav',
    },
    {
      'name': 'Younger Brother',
      'image': 'assets/images/family_members/family_younger_brother.png',
      'audio': 'assets/sounds/family_members/youngerbrother.wav',
    },
    {
      'name': 'Older Sister',
      'image': 'assets/images/family_members/family_older_sister.png',
      'audio': 'assets/sounds/family_members/oldersister.wav',
    },
    {
      'name': 'Younger Sister',
      'image': 'assets/images/family_members/family_younger_sister.png',
      'audio': 'assets/sounds/family_members/youngersister.wav',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Family Members'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: familyMembers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              playAudioFile(familyMembers[index]['audio']);
            },
            child: Column(
              children: [
                Image.asset(
                  familyMembers[index]['image'],
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 8),
                Text(familyMembers[index]['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ColorsScreen extends StatelessWidget {
  final Function playAudioFile;

  ColorsScreen(this.playAudioFile);

  // Define the list of colors
  final List<Map<String, dynamic>> colors = [
    {
      'name': 'Red',
      'image': 'assets/images/colors/color_red.png',
      'audio': 'assets/sounds/colors/red.wav'
    },
    {
      'name': 'Green',
      'image': 'assets/images/colors/color_green.png',
      'audio': 'assets/sounds/colors/green.wav'
    },
    {
      'name': 'Yellow',
      'image': 'assets/images/colors/yellow.png',
      'audio': 'assets/sounds/colors/yellow.wav'
    },
    {
      'name': 'Dusty Yellow',
      'image': 'assets/images/colors/color_dusty_yellow.png',
      'audio': 'assets/sounds/colors/dusty yellow.wav'
    },
    {
      'name': 'Brown',
      'image': 'assets/images/colors/color_brown.png',
      'audio': 'assets/sounds/colors/brown.wav'
    },
    {
      'name': 'Black',
      'image': 'assets/images/colors/color_black.png',
      'audio': 'assets/sounds/colors/black.wav'
    },
    {
      'name': 'White',
      'image': 'assets/images/colors/color_white.png',
      'audio': 'assets/sounds/colors/white.wav'
    },
    {
      'name': 'Gray',
      'image': 'assets/images/colors/color_gray.png',
      'audio': 'assets/sounds/colors/gray.wav'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Colors'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: colors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              playAudioFile(colors[index]['audio']);
            },
            child: Column(
              children: [
                Image.asset(
                  colors[index]['image'],
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 8),
                Text(colors[index]['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}
