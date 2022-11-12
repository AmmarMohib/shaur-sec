import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:shaur_sec/components/customs/photo_view.dart';
import 'package:shaur_sec/services/download_file.dart';

class ChatModel extends StatefulWidget {
  final data;
  final datatext;
  final modelColor;
  const ChatModel(
      {super.key,
      required this.data,
      required this.datatext,
      required this.modelColor, });

  @override
  State<ChatModel> createState() => _ChatModelState();
}

class _ChatModelState extends State<ChatModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        this.activate();
        print("long pressed");
        // CAB();
      },
      child: Container(
                                        decoration: BoxDecoration(
                                          color: widget.modelColor,
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Column(
                                            children: [
                                              // Text(widget.name),
                                              Row(
                                                children: [
                                                  widget.datatext !=
                                                          null
                                                      ? widget.data['type'] ==
                                                                  "document" ||
                                                              widget.data["type"] ==
                                                                      "video" &&
                                                                  validator.url(
                                                                      widget.datatext)
                                                          ? InkWell(
                                                              onTap: () async {
                                                                // if (await canLaunchUrl(
                                                                //  Uri.parse( data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']))) {
                                                                //   await launchUrl(Uri.parse(data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']), mode: LaunchMode.externalApplication);
                                                                // } else {
                                                                //   throw 'Could not launch ${data['ar0Z7hs8KsVuottCEpVm9WlPrCO2']}';
                                                                // }
                                                                if (widget.data['type'] ==
                                                                        "document" ||
                                                                    widget.data['type'] ==
                                                                        "video") {
                                                                  print(
                                                                      "object");
                                                                  _downloadFile(
                                                                      widget.datatext,
                                                                      widget.data[
                                                                          'name']);
                                                                }
                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder:
                                                                //             (context) =>
                                                                //                 PdfViewer(
                                                                //                   fileName:
                                                                //                       data['name'],
                                                                //                   URl:
                                                                //                       data['ar0Z7hs8KsVuottCEpVm9WlPrCO2'],
                                                                //                 )));
                                                              },
                                                              child: SizedBox(
                                                                width: 100,
                                                                child: Text(
                                                                  widget.data['name'],
                                                                style: TextStyle(
                                                                  color: Colors.white
                                                                ),  
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                ),
                                                                
                                                              ),
                                                            )
                                                          : widget.data["type"] ==
                                                                  "image"
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PhotoViewer(
                                                                                imgUrl: widget.datatext,
                                                                              )),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            120.0,
                                                                        width:
                                                                            150.0,
                                                                        child: Image(
                                                                            image:
                                                                                NetworkImage(widget.datatext)),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              // : Text("")
                                                              // :
                                                              : Container(
                                                                  width: 300,
                                                                  child: Text(
                                                                    widget.datatext,
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 17
                                                                    ),
                                                                    maxLines:
                                                                        null,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .visible,
                                                                  ))
                                                      : Container(),

                                                  // (data[widget.uid!] != null)
                                                  // ?
                                                  widget.datatext !=
                                                          null
                                                      ? Text(
                                                          widget.data["senttime"]
                                                              .toString(),
                                                          // data['sentOn'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : Container(),
                                                  // : Container()
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
    );
  }

  Future<void> _downloadFile(url, name) async {
    print('downloading fle');
    DownloadService downloadService =
        kIsWeb ? WebDownloadService() : MobileDownloadService();
    await downloadService.download(url: url, name: name);
  }
}
