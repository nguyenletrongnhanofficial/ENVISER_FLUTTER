import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/challenge/screens/select_date_screen.dart';
import 'package:uit_hackathon/features/challenge/services/challenge_services.dart';
import 'package:uit_hackathon/features/challenge/widgets/box.dart';
import 'package:uit_hackathon/features/challenge/widgets/item_upload_group.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/date_ext.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/widgets/loader.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

class CreateChallengeScreen extends StatefulWidget {
  const CreateChallengeScreen({super.key});
  static const String routeName = '/create_challenge_screen';
  @override
  State<CreateChallengeScreen> createState() => _CreateChallengeScreenState();
}

class _CreateChallengeScreenState extends State<CreateChallengeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<File> images = [];
  String? selectDate;
  bool isLoading = false;
  TimeOfDay timeStart = const TimeOfDay(
    hour: 20,
    minute: 00,
  );
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  final ChallengeServices challengeServices = ChallengeServices();

  chooseTimeStart(BuildContext context) async {
    //final challengeProvider = context.read<ChallengeProvider>();

    final TimeOfDay? value = await showTimePicker(
      context: context,
      initialTime: timeStart,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (value != null) {
      setState(() {
        timeStart = value;
      });
    }
  }

  void createChallenge(BuildContext context) async {
    final userProvider = context.read<UserProvider>();

    setState(() {
      isLoading = true;
    });
    startDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      timeStart.hour,
      timeStart.minute,
    );
    Challenge challenge = Challenge(
      title: titleController.text,
      description: descriptionController.text,
      startTime: startDate.millisecondsSinceEpoch,
      images: [],
      endTime: endDate.millisecondsSinceEpoch,
      maximumParticipants: int.parse(numberController.text),
      address: 'Bình Dương',
      userId: userProvider.user.id,
    );
    await challengeServices.createChallenge(
      context: context,
      challenge: challenge,
      images: images,
    );
    Navigator.of(context).pop();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tạo thử thách',
          style: AppStyles.medium.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          // write title
          Box(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiêu đề',
                  style: AppStyles.medium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Divider(
                  color: AppColors.textSecondaryColor,
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    scrollPadding: EdgeInsets.zero,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Ghi ngắn gọn tiêu đề...',
                      hintStyle: AppStyles.regular.copyWith(
                        fontSize: 17,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // write description
          Box(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mô tả',
                  style: AppStyles.medium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Divider(
                  color: AppColors.textSecondaryColor,
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    scrollPadding: EdgeInsets.zero,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText:
                          'Hãy mô tả cho mọi người biết rằng\nchallenge của bạn cụ thể như thế nào...',
                      hintStyle: AppStyles.regular.copyWith(
                        fontSize: 17,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // your photos
          Box(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ảnh của bạn',
                  style: AppStyles.medium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                ItemUploadGroup(
                  images: images,
                ),
              ],
            ),
          ),
          // date
          GestureDetector(
            onTap: () async {
              final result = await Navigator.of(context)
                  .pushNamed(SelectDateScreen.routeName);
              if (result is List<DateTime?>) {
                setState(() {
                  startDate = result[0]!;
                  endDate = result[1]!;
                  selectDate =
                      '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  // // image
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chọn ngày',
                        style: AppStyles.medium.copyWith(fontSize: 18),
                      ),
                      Text(
                        selectDate ?? 'Chọn ngày',
                        style: AppStyles.regular.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => chooseTimeStart(context),
                  child: Box(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.timelapse,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chọn giờ', style: AppStyles.medium),
                            Text(
                              '${timeStart.hour}:${timeStart.minute}',
                              style: AppStyles.regular.copyWith(
                                color: AppColors.textSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Box(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.only(
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.people,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Số người', style: AppStyles.medium),
                            TextField(
                              controller: numberController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          isLoading
              ? const Loader()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PrimaryButton(
                    color: AppColors.primaryColor,
                    text: 'Tạo challenge',
                    onPress: () => createChallenge(context),
                  ),
                ),
        ],
      ),
    );
  }
}
