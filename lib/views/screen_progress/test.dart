// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:miniproject/components/theme.dart';
// import 'package:miniproject/viewModels/provider_progress/provider_progress.dart';
// import 'package:miniproject/views/screen_progress/screen_progres_empty.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:path_provider/path_provider.dart';

// class ProgresEditScreen extends StatefulWidget {
//   const ProgresEditScreen({super.key});

//   @override
//   State<ProgresEditScreen> createState() => _ProgresEditScreenState();
// }

// class _ProgresEditScreenState extends State<ProgresEditScreen> {
//   final titleController = TextEditingController();

//   final contentController = TextEditingController();
//   final picker = ImagePicker();
//   File? _image;

//   @override
//   void dispose() {
//     titleController.dispose();
//     contentController.dispose();
//     _image = File('assets/images/');
//     super.dispose();

//     void getImage(ImageSource imageSource) async {
//       XFile? imageFile = await picker.pickImage(source: imageSource) as XFile?;

//       if (imageFile == null) return;

//       File tmpFile = File(imageFile.path);
//       final appDir = await getApplicationDocumentsDirectory();

//       final fileName = basename(imageFile.path);
//       tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
//       setState(() {
//         _image = tmpFile;
//       });
//     }
//   }

//   void saveProgress() {
//     String title = titleController.text;
//     String content = contentController.text;

//     String imagePath = _image != null ? _image!.path : '';
//     int id = DateTime.now().millisecondsSinceEpoch;
//     Provider.of<ProgressProvider>(this.context, listen: false)
//         .addOrUpdateProgress(id, title, content, imagePath, EditMode.ADD);

//     Navigator.of(this.context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => emptyProgress(context),
//         settings: RouteSettings(arguments: id),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Add Progress",
//           style: DesignSystem.headlineMedium,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // getImage(ImageSource.camera);
//             },
//             icon: const Icon(Icons.camera),
//           ),
//           IconButton(
//             onPressed: () {
//               // getImage(ImageSource.gallery);
//             },
//             icon: const Icon(Icons.insert_photo),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.delete),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: TextField(
//                 controller: titleController,
//                 maxLines: null,
//                 textCapitalization: TextCapitalization.sentences,
//                 style: DesignSystem.headlineMedium,
//                 decoration: const InputDecoration(
//                   hintText: 'Progress Title',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             if (_image != null)
//               Container(
//                 padding: const EdgeInsets.all(12.0),
//                 height: 250,
//                 width: double.infinity,
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         image: DecorationImage(
//                           image: FileImage(_image!),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(12),
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: DesignSystem.black,
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               setState(
//                                 () {
//                                   _image = null as File;
//                                 },
//                               );
//                             },
//                             child: const Icon(
//                               Icons.add,
//                               size: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: TextField(
//                 controller: contentController,
//                 maxLength: null,
//                 style: DesignSystem.bodyMedium,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter Something...',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         heroTag: 'button_2',
//         onPressed: () {
//           if (titleController.text.isEmpty) {
//             titleController.text = 'Untitled Progress';
//             saveProgress();
//           }
//         },
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
// }
