import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotify_clone/Utils/notify.dart';

class AudioPlayerPro extends StatefulWidget {
  AudioPlayerPro(
      {super.key,
      required this.audioURL,
      required this.image,
      required this.name});

  final String audioURL;
  final String image;
  final String name;

  @override
  State<AudioPlayerPro> createState() => _AudioPlayerProState();
}

class _AudioPlayerProState extends State<AudioPlayerPro> {
  Notify notify = Get.find();

  Duration _duration = Duration();
  Duration _position = Duration();

  static AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
  }

  void seekToSecond(second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChanged() {
    Duration newDuration = Duration(seconds: 0);
    advancedPlayer.seek(newDuration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.brown,
              Colors.black87,
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(
                  LineIcons.angleDown,
                  color: Colors.white,
                  size: 24,
                ),
                Column(
                  children: [
                    Text(
                      "PLAYING FROM ALBUM",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'ProximaNovaThin',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(
                  LineIcons.verticalEllipsis,
                  color: Colors.white,
                  size: 24,
                ),
              ]),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 325,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.image,
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              wordSpacing: 0.2,
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Classics",
                          style: TextStyle(
                              letterSpacing: 0.1,
                              fontSize: 17,
                              color: Colors.grey.shade400,
                              fontFamily: 'ProximaNovaThin',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        notify.isHeartPressed.value =
                            notify.isHeartPressed.value ? false : true;
                      },
                      icon: Obx(
                        () => (notify.isHeartPressed.value)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.green,
                                size: 24,
                              )
                            : Icon(
                                LineIcons.heart,
                                color: Colors.white,
                                size: 24,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade600,
                          activeTickMarkColor: Colors.white,
                          thumbColor: Colors.white,
                          trackHeight: 3,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 4,
                          )),
                      child: Slider(
                        value: (_position.inSeconds.toDouble() !=
                                _duration.inSeconds.toDouble())
                            ? _position.inSeconds.toDouble()
                            : setChanged(),
                        onChanged: (value) {
                          setState(() {
                            seekToSecond(value.toInt());
                            value = value;
                          });
                        },
                        max: _duration.inSeconds.toDouble(),
                        min: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_position.inMinutes.toInt()}:${(_position.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'ProximaNovaThin',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_duration.inMinutes.toInt()}:${(_duration.inSeconds % 60).toString().padLeft(2, "0")}",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'ProximaNovaThin',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      LineIcons.random,
                      color: Colors.grey.shade400,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      child: Center(
                        child: IconButton(
                          iconSize: 70,
                          alignment: Alignment.center,
                          onPressed: () {
                            notify.isIconPlay.value =
                                notify.isIconPlay.value ? false : true;

                            if (notify.isIconPlay.value) {
                              advancedPlayer.play(UrlSource(widget.audioURL));
                            } else {
                              advancedPlayer.pause();
                            }
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                                  id: 123,
                                  channelKey: "basic",
                                  title: 'Now playing - ${widget.name}',
                                  autoDismissible: false,
                                  displayOnBackground: true,
                                  payload: {"name": "FlutterCampus"},
                                ),
                                actionButtons: [
                                  NotificationActionButton(
                                    key: 'play',
                                    label: 'play',
                                    autoDismissible: false,
                                    showInCompactView: true,
                                    actionType: ActionType.KeepOnTop,
                                  ),
                                  NotificationActionButton(
                                    key: 'pause',
                                    label: 'pause',
                                    autoDismissible: false,
                                    showInCompactView: true,
                                    actionType: ActionType.KeepOnTop,
                                  ),
                                  NotificationActionButton(
                                    key: 'stop',
                                    label: 'stop',
                                    autoDismissible: false,
                                    showInCompactView: true,
                                    actionType: ActionType.KeepOnTop,
                                  ),
                                ]);
                          },
                          icon: Obx(
                            () => (notify.isIconPlay.value)
                                ? Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Icon(
                      Icons.repeat,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  children: [
                    Icon(
                      Icons.speaker_group_outlined,
                      color: Colors.grey.shade400,
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Share.share("https://spotify/songid-32919109");
                      },
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.line_weight_sharp,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
