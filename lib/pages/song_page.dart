import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_player_ui/utils/my_box.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  IconData repeatIcon = Icons.repeat;
  bool isPlaying = false;
  bool isFavorite = true;

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void changeIcon() {
    // icons are repeate, repeat_one and shuffle
    if (repeatIcon == Icons.repeat) {
      setState(() {
        repeatIcon = Icons.repeat_one;
      });
    } else if (repeatIcon == Icons.repeat_one) {
      setState(() {
        repeatIcon = Icons.shuffle;
      });
    } else {
      setState(() {
        repeatIcon = Icons.repeat;
      });
    }
  }

  double getTimePercentage(String time1, String time2) {
    // time1 and time2 are in the format "0:00"
    // get the time in seconds
    int time1Seconds =
        int.parse(time1.split(":")[0]) * 60 + int.parse(time1.split(":")[1]);
    int time2Seconds =
        int.parse(time2.split(":")[0]) * 60 + int.parse(time2.split(":")[1]);

    // return the percentage of time1Seconds in time2Seconds
    return time1Seconds / time2Seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // return button and menu button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    "P L A Y L I S T",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                  ),
                  MyBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ],
              ),

              // cover art, artist name, song name
              MyBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/song_image.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ooouuu',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'SAMARA',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: favorite,
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // line to show time elapsed
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MyBox(
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    percent: getTimePercentage("1:10", "5:23"),
                    progressColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                    barRadius: const Radius.circular(8),
                  ),
                ),
              ),

              // time, repeat button, album icon, total time
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("1:10"),
                    IconButton(
                      onPressed: changeIcon,
                      icon: Icon(repeatIcon),
                    ),
                    Icon(
                      Icons.queue_music,
                      color: Colors.grey.shade700,
                    ),
                    const Text("5:23"),
                  ],
                ),
              ),

              // play, pause, next, previous buttons
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO previous song
                          if (kDebugMode) {
                            print("previous");
                          }
                        },
                        child: const MyBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GestureDetector(
                          onTap: togglePlay,
                          child: MyBox(
                            child: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO next song
                          if (kDebugMode) {
                            print("next");
                          }
                        },
                        child: const MyBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
