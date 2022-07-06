import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class TwitterView extends StatelessWidget {
  const TwitterView(
      {Key? key,
      required this.responseText,
      required this.mediaUrls,
      required this.responseMedias,
      required this.mediaType})
      : super(key: key);
  final String responseText;
  final String responseMedias;
  final String mediaUrls;
  final String mediaType;

  @override
  Widget build(BuildContext context) {
    // List<String> picList = picURL.split(';');
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: CachedNetworkImageProvider(
                                "https://pbs.twimg.com/profile_images/1519512623510867969/5Fgd9XYI_200x200.jpg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SelectableText(
                              'Pajeet Yeeter',
                              textScaleFactor: 1.5,
                            ),
                            SelectableText(
                              '@YeetPajeet',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    CopyTweet(
                      tweet: '$responseText $responseMedias',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: SelectableText(
                    responseText,
                    textScaleFactor: 1.5,
                  ),
                ),
                mediaType == "pic"
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Text(
                            responseText,
                          ),
                          imageUrl: mediaUrls,
                          errorWidget: (context, url, error) => Text(
                            responseText,
                          ),
                        ),
                      )
                    : VideoWidget(mediaUrls: mediaUrls),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    Key? key,
    required this.mediaUrls,
  }) : super(key: key);

  final String mediaUrls;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.mediaUrls)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    ]);
  }
}

class CopyTweet extends StatefulWidget {
  const CopyTweet({Key? key, required this.tweet}) : super(key: key);
  final String tweet;
  @override
  State<CopyTweet> createState() => _CopyTweetState();
}

class _CopyTweetState extends State<CopyTweet> {
  String text = 'Copy';
  Color buttonColor = Colors.blue;
  IconData icon = Icons.copy;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((state) => Colors.grey)),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: widget.tweet));
        setState(() {
          text = 'Copied!';
          icon = Icons.check;
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              text = 'Copy';
              icon = Icons.copy;
            });
          });
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 4,
          ),
          Text(text),
        ],
      ),
    );
  }
}
