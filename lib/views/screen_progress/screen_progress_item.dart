import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/database_models/database_provider.dart';
import 'package:miniproject/models/progress_models/progress_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProgressItem extends StatefulWidget {
  final ProgressModel? progresModel;
  const ProgressItem({super.key, this.progresModel});

  @override
  State<ProgressItem> createState() => _ProgressItemState();
}

class _ProgressItemState extends State<ProgressItem> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _isUpdate = false;
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.progresModel != null) {
      _titleController.text = widget.progresModel!.title!;
      _contentController.text = widget.progresModel!.content!;
      _isUpdate = true;
    }
  }

  getFromGallery() async {
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Permission denied or action canceled."),
          ),
        );
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Access denied or action canceled."),
        ),
      );
    }
  }

  getFromCamera() async {
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Action canceled."),
          ),
        );
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Camera access denied."),
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Progress",
          style: DesignSystem.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              getFromCamera();
            },
            icon: const Icon(Icons.camera),
          ),
          IconButton(
            onPressed: () {
              getFromGallery();
            },
            icon: const Icon(Icons.insert_photo),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(File(imageFile!.path),
                            fit: BoxFit.cover))
                    : const Icon(
                        Icons.image_outlined,
                        color: DesignSystem.black,
                      ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      style: DesignSystem.headlineMedium,
                      decoration: const InputDecoration(
                        hintText: 'Progress Title',
                        border: InputBorder.none,
                      ),
                    ),
                    TextField(
                      controller: _contentController,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      style: DesignSystem.bodyLarge,
                      decoration: const InputDecoration(
                        hintText: 'Type Something...',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              const SizedBox(height: 370),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: DesignSystem.mainBlue,
                  onPressed: () {
                    if (!_isUpdate) {
                      final thisProgress = ProgressModel(
                        title: _titleController.text,
                        content: _contentController.text,
                        imagePath: imageFile != null ? imageFile!.path : "",
                      );
                      Provider.of<DbManager>(context, listen: false)
                          .addProgress(thisProgress);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Progress added successfully"),
                        ),
                      );
                    } else {
                      final thisProgress = ProgressModel(
                        id: widget.progresModel!.id,
                        title: _titleController.text,
                        content: _contentController.text,
                        imagePath: imageFile != null ? imageFile!.path : "",
                      );
                      Provider.of<DbManager>(context, listen: false)
                          .updateProgress(thisProgress);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Progress updated sucessfully"),
                        ),
                      );
                      _formKey.currentState?.reset();
                      setState(() {
                        imageFile = null;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.save,
                    color: DesignSystem.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
