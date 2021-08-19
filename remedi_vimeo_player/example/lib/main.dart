import 'package:flutter/material.dart';
import 'package:remedi_vimeo_player/remedi_vimeo_player.dart';

void main() {
  runApp(VimeoExample());
}

class VimeoExample extends StatefulWidget {
  @override
  _VimeoExampleState createState() => _VimeoExampleState();
}

class _VimeoExampleState extends State<VimeoExample> {
  VimeoVideo? vimeoVideo;
  BetterPlayerController? controller;

  Future<dynamic> initVimeo() async {
    var res = await Vimeo(
      "your vimeo video id",
      // optional
      accessKey: "your vimeo accessKey",
    ).vimeo;

    if (res is VimeoError) {
      return res;
    }

    if (res is VimeoVideo) {
      vimeoVideo = res;
      controller = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          vimeoVideo!.videoUrl.toString(),
        ),
      );
    }

    return vimeoVideo;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose(forceDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          body: Stack(alignment: Alignment.topCenter, children: [
            FutureBuilder<dynamic>(
              future: initVimeo(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700)),
                      child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                              child:
                                  Center(child: CircularProgressIndicator()))));
                }

                if (snapshot.data is VimeoError) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "${(snapshot.data as VimeoError).developerMessage}" +
                                "\n${(snapshot.data as VimeoError).errorCode ?? ""}" +
                                "\n\n${(snapshot.data as VimeoError).error}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return VimeoPlayer(
                  vimeoVideo: vimeoVideo!,
                  videoController: controller!,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 48,
                color: Colors.red.withOpacity(0.3),
                alignment: Alignment.center,
                child: Text(
                  'Vimeo Player Example',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ])),
    );
  }
}
