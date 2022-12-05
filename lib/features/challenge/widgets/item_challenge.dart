import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ItemChallenge extends StatelessWidget {
  final Challenge challenge;

  const ItemChallenge({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              challenge.title,
              style: AppStyles.semibold.copyWith(),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Tiêu đề: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: challenge.title,
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Thời gian: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${DateFormat('dd/MM/yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(challenge.startTime),
                  )} - ${DateFormat('dd/MM/yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(challenge.endTime),
                  )}',
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Số người tham gia: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: challenge.maximumParticipants.toString(),
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
