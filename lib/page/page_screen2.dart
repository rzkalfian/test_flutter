import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PageScreen2 extends StatefulWidget {
  const PageScreen2({super.key});

  @override
  State<PageScreen2> createState() => _PageScreen2State();
}

class _PageScreen2State extends State<PageScreen2> {
  XFile? _image;
  bool _switchPanelCondition = false;
  PanelController pc = PanelController();
  Future<XFile?> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        return image;
      }
    } catch (e) {
      // Handle errors gracefully
      print("Error picking image: $e");
    }
    return null;
  }
  // Future<XFile?> getImageFromCamera() async {
  //   var image = await pickImage(source: ImageSource.camera);
  //   return image;
  // }

  // Future<XFile?> getImageFromGallery() async {
  //   var image = await pickImage(source: ImageSource.gallery);
  //   return image;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upload Images",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              SizedBox(
                  // margin: const EdgeInsets.only(right: 20),
                  width: MediaQuery.sizeOf(context).width,
                  child: _image != null
                      ? Text(
                          path.basename(File(_image!.path).path),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      : Container()),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final XFile? image =
                                    await pickImage(ImageSource.camera);
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.blue,
                              ),
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final XFile? image =
                                    await pickImage(ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    _image = image;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.image_rounded,
                                color: Colors.blue,
                              ),
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _image == null
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pratinjau Gambar",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 240,
                          // width: 300,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          child: InteractiveViewer(
                            child: Image.file(
                              File(_image!.path),
                              alignment: Alignment.center,
                              // width: 100,
                              // height: 100,
                              fit: BoxFit.contain,
                            ),
                          )),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
