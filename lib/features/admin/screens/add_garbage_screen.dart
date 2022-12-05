import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/services/garbage_services.dart';
import 'package:uit_hackathon/features/challenge/widgets/item_add_image.dart';
import 'package:uit_hackathon/features/home/widgets/item_type.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/widgets/loader.dart';

class AddGarbageModal extends StatefulWidget {
  const AddGarbageModal({super.key});

  @override
  State<AddGarbageModal> createState() => _AddGarbageModalState();
}

class _AddGarbageModalState extends State<AddGarbageModal> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  final List<Map<String, dynamic>> types = [
    {'type': 'Khó phân huỷ'},
    {'type': 'Tái chế'},
    {'type': "Đồ dùng cũ"},
  ];
  addGarbage(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    Garbage garbage = Garbage(name: nameController.text, price: double.parse(moneyController.text), type: type, description: descriptionController.text, url: 'url');
    await GarbageServices().addGarbage(context: context,garbage: garbage,file: file!);
    setState(() {
      isLoading = false;
    });
  }
  bool isLoading = false;

  String type = 'Khó phân huỷ';
  File? file;

  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(100.0),
          ),
        ),
        height: size.height * 0.77,
        child: Column(
          children: [
            const Icon(Icons.remove, size: 40),
            SizedBox(
              width: width * 0.8,
              child: Text(
                "Thêm rác mới",
                textAlign: TextAlign.center,
                style: AppStyles.bold.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    String name = types[index]['type'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          type = name;
                        });
                      },
                      child: ItemType(
                        type: name,
                        isCheck: type == name ? true : false,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Phân loại rác",
                  textAlign: TextAlign.left,
                  style: AppStyles.semibold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SizedBox(
                height: height * 0.05,
                width: width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: nameController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tên rác thải',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        height: height * 0.002,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Chi tiết",
                  textAlign: TextAlign.center,
                  style: AppStyles.semibold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: height * 0.1,
                  width: width * 0.9,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Chi tiết về loại rác",
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        height: height * 0.002,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Giá (VNĐ/KG)",
                  textAlign: TextAlign.left,
                  style: AppStyles.semibold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SizedBox(
                height: height * 0.05,
                width: width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: moneyController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Giá',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        height: height * 0.002,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: height * 0.035),
                child: Column(
                  children: [
                    file == null
                        ? InkWell(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.image,
                              );
    
                              if (result != null) {
                                setState(() {
                                  file = File(result.files.single.path!);
                                });
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: DottedBorder(
                                dashPattern: const [8, 5],
                                color: AppColors.primaryColor,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                padding: const EdgeInsets.all(0),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              file!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    Text(
                      "Thêm ảnh của bạn",
                      style: AppStyles.semibold.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            isLoading
                ? const Loader()
                : SizedBox(
                    height: height * 0.065,
                    width: width * 0.9,
                    child: ElevatedButton(
                      onPressed: () => addGarbage(context),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                      ),
                      child: const Text(
                        "Đăng",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
