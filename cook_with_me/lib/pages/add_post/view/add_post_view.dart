import 'package:cook_with_me/model/call_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
        child: Column(children: [
          GestureDetector(
            child: Container(
              height: 200,
              color: Colors.white,
              child: Center(
                child: GetBuilder<AddPostController>(builder: (_) {
                  return controller.image != null
                      ? Image.file(
                          controller.image!,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "https://res.cloudinary.com/doeo0czgr/image/upload/v1670596801/jmhcxvfg68i3g1g1hgcr.png?fbclid=IwAR2pJX_83e4tN7O5fkNhZJgXzvors7Snna4GlZxNtz8os2aUX3EEN-827io",
                          fit: BoxFit.fitWidth,
                        );
                }),
              ),
            ),
            onTap: () {
              controller.getImage(ImageSource.gallery);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(children: [
              Obx(() {
                if (controller.menuItems.isNotEmpty) {
                  controller.selectedDropdown.value =
                      controller.menuItems[0].value ?? "Select category";
                  return Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Obx(
                        () => DropdownButton(
                            underline: Container(color: Colors.transparent),
                            elevation: 16,
                            dropdownColor: Colors.white,
                            value: controller.selectedDropdown.value,
                            items: controller.menuItems,
                            onChanged: (value) {
                              controller.selectedDropdown.value = value!;
                            }),
                      ));
                } else {
                  return const SizedBox(
                    height: 0,
                  );
                }
              }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: controller.nameController.value,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: controller.ingredientsController.value,
                  maxLines: 5,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Ingredients",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: controller.step1Controller.value,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Step 1",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.getImage1(ImageSource.gallery);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: GetBuilder<AddPostController>(builder: (_) {
                      return controller.image1 != null
                          ? Image.file(
                              controller.image1!,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              "https://res.cloudinary.com/doeo0czgr/image/upload/v1670596801/jmhcxvfg68i3g1g1hgcr.png?fbclid=IwAR2pJX_83e4tN7O5fkNhZJgXzvors7Snna4GlZxNtz8os2aUX3EEN-827io",
                              fit: BoxFit.fitWidth,
                            );
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  controller: controller.linkVideoController.value,
                  style: const TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Link video",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // controller.demoUpload();
                          print("click add item button");
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFF588A67),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "Add item",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFA6163),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ]),
              )
            ]),
          )
        ]),
      )),
    );
  }
}
