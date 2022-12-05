import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/challenge/screens/select_date_screen.dart';
import 'package:uit_hackathon/features/schedule/current_location_screen.dart';
import 'package:uit_hackathon/features/schedule/services/schedule_services.dart';
import 'package:uit_hackathon/models/schedule.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/utils/date_ext.dart';

import 'package:uit_hackathon/widgets/loader.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

import '../home/widgets/item_type.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});
  static const String routeName = '/create_schedule_screen';
  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  String day = 'Tất cả các ngày';
  String time = '8h - 17h30';
  final List<Map<String, dynamic>> times = [
    {'time': '8h - 17h30'},
    {'time': '17h30 - 22h'},
  ];

  @override
  void initState() {
    super.initState();
  }

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  bool isLoading = false;
  String? address;
  ScheduleServices scheduleServices = ScheduleServices();
  String? selectDate;

  createOrder(BuildContext context) async {
    final UserProvider userProvider = context.read<UserProvider>();
    setState(() {
      isLoading = true;
    });
    startDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    Schedule schedule = Schedule(
      user: userProvider.user.id,
      endDate: endDate.millisecondsSinceEpoch,
      type: 'Nhà ở',
      address: address!,
      time: time,
      status: 'Chưa thanh toán',
      startDate: startDate.millisecondsSinceEpoch,
    );
    await scheduleServices.createChallenge(
      context: context,
      schedule: schedule,
    );
    Navigator.of(context).pop();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.1, size.width * 0.05, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Đặt lịch thu gom',
                style: AppStyles.semibold.copyWith(
                  color: AppColors.textPrimaryColor,
                ),
              ),
              Text(
                'Vui lòng chọn địa chỉ và thời gian thu gom mong muốn',
                style: AppStyles.regular,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(child: Image.asset(AppAssets.schedule)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(AppAssets.icAddress),
                  const SizedBox(width: 10),
                  Text(
                    'Địa chỉ',
                    style: AppStyles.semibold.copyWith(
                      color: AppColors.textPrimaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.borderColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          address ?? 'Đông Hòa, Dĩ An, Bình Dương',
                          style: AppStyles.regular.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            final value = await Navigator.pushNamed(
                              context,
                              CurrentLocationScreen.routeName,
                            );
                            if (value is List<double>) {
                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                value[0],
                                value[1],
                              );
                              setState(() {
                                address = placemarks[0].street;
                              });
                            }
                          },
                          child: Image.asset(AppAssets.icMap)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Chọn ngày',
                    style: AppStyles.semibold.copyWith(
                      color: AppColors.textPrimaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.borderColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          selectDate ?? 'Chọn ngày',
                          style: AppStyles.regular.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
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
                        child: const Icon(
                          Icons.calendar_month,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Image.asset(AppAssets.icClock),
                  const SizedBox(width: 10),
                  Text(
                    'Thời gian thu rác',
                    style: AppStyles.semibold.copyWith(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: times.length,
                    itemBuilder: (context, index) {
                      String name = times[index]['time'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            time = name;
                          });
                        },
                        child: ItemType(
                          type: name,
                          isCheck: time == name ? true : false,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              isLoading
                  ? const Loader()
                  : PrimaryButton(
                      text: 'Xác nhận',
                      color: AppColors.primaryColor,
                      onPress: () => createOrder(context),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
