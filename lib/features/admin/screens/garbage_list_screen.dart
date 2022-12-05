import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/schedule.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class GarbageList extends StatefulWidget {
  const GarbageList({super.key});

  @override
  State<GarbageList> createState() => _GarbageListState();
}

class _GarbageListState extends State<GarbageList> {
  List<Schedule> schedules = [
    Schedule(
      user: 'Nguyễn Văn A',
      address: 'Quận 1, TP. Hồ Chí Minh',
      time: 'Thứ 2, 8:00 - 9:00',
      status: 'Đã hoàn thành',
      startDate: 100,
      endDate: 1000,
      type: "ok",
    ),
    Schedule(
      user: 'Nguyễn Văn B',
      address: 'Dĩ An, Bình Dương',
      time: 'Thứ 2, 8:00 - 9:00',
      status: 'Đã hoàn thành',
      startDate: 100,
      endDate: 1000,
      type: "ok",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Xét duyệt',
            style: AppStyles.medium.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: schedules.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ScheduleInfo(
                  height: height, width: width, schedule: schedules[index]),
            );
          }),
    );
  }
}

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo({
    super.key,
    required this.height,
    required this.width,
    required this.schedule,
  });

  final double height;
  final double width;
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * 0.21,
        width: width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 13, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/clock.png'),
                    color: Colors.green,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Thời gian thu gom: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: schedule.time,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/place.png'),
                    color: Colors.green,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Địa chỉ: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: schedule.address,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/phone.png'),
                    color: Colors.green,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "Số điện thoại: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "0918627999",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEDED),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: width * 0.2,
                      height: height * 0.04,
                      child: const Center(
                        child: Text(
                          "Thành công",
                          style: TextStyle(
                            color: Color(0xFF0E9D57),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8FDF2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: width * 0.27,
                      height: height * 0.04,
                      child: const Center(
                        child: Text(
                          "Không liên hệ được",
                          style: TextStyle(
                            color: Color(0xFF5386E4),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8FDF2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: width * 0.2,
                      height: height * 0.04,
                      child: const Center(
                        child: Text(
                          "Hủy yêu cầu",
                          style: TextStyle(
                            color: Color(0xFFDC312D),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
