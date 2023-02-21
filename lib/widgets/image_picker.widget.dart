import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget(
    this.assignImageFn, {
    Key? key,
  }) : super(key: key);

  final Function(XFile xFile) assignImageFn;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? currentFilePath;
  final _imagePicker = ImagePicker();

  void _pickImage() async {
    XFile? picked = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    setState(() {
      currentFilePath = picked?.name;
    });

    if (picked != null) {
      widget.assignImageFn(picked);
    }

    log("Selected Image File Name: ${picked?.name ?? "Null"}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: _pickImage,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 10,
              ),
              child: Text("Choose file"),
            ),
          ),
          if (currentFilePath != null)
            SizedBox(
              width: 100,
              child: Text(
                currentFilePath!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          IconButton(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
