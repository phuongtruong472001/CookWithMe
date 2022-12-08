import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_post_controller.dart';

class AddPostPage extends GetView<AddPostController> {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBCD6BE),
        title: const Text("Add Post"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFBCD6BE),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(children: []),
        ),
      )),
    );
  }
}
