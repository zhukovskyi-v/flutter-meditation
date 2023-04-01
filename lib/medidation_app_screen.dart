import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/models/item_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  int? playingIndex;

  Widget showIcon(int playIndex) => playIndex == playingIndex
      ? const FaIcon(FontAwesomeIcons.pause)
      : const FaIcon(FontAwesomeIcons.play);

   onPlayPressed(int index) => () async {
        try {
          if (playingIndex == index) {
            audioPlayer.pause();
            setState(() {
              playingIndex = null;
            });
          } else {
           await audioPlayer.setAsset(audioItems[index].audioPath).catchError((onError){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('e.message'), backgroundColor: Colors.red));
            });
            audioPlayer.play();
            setState(() {
              playingIndex = index;
            });
          }
        }catch(e){
          print('================================================================');
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              physics:
                  const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
              itemCount: audioItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(audioItems[index].imagePath),
                            fit: BoxFit.fill)),
                    child: ListTile(
                      title: Text(audioItems[index].name),
                      leading: IconButton(
                        icon: showIcon(index),
                        onPressed: onPlayPressed(index),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
