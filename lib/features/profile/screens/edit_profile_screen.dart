import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/profile/widgets/input_text.dart';
import 'package:uit_hackathon/models/user.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;
  const EditProfileScreen({
    super.key,
    required this.user,
  });
  static const String routeName = '/edit_profile_screen';
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _genderController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(AppAssets.icBack),
        ),
        title: Text(
          'Edit Profile',
          style: AppStyles.medium.copyWith(
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: AppStyles.medium.copyWith(
                fontSize: 16,
                color: const Color(0xFFFE9870),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1657299143548-658603d76b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AppAssets.icCamera),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'MR/MRS',
              style: AppStyles.medium.copyWith(
                fontSize: 12,
                color: const Color(0xFF7D8699),
              ),
            ),
            InputText(
              onChanged: (value) {},
              type: TextInputType.text,
              hintText: 'Mrs',
              controller: _genderController,
            ),
            const SizedBox(height: 20),
            Text(
              'FIRST NAME',
              style: AppStyles.medium.copyWith(
                fontSize: 12,
                color: const Color(0xFF7D8699),
              ),
            ),
            InputText(
              onChanged: (value) {},
              type: TextInputType.text,
              hintText: 'Julia',
              controller: _firstNameController,
            ),
            const SizedBox(height: 20),
            Text(
              'LAST NAME',
              style: AppStyles.medium.copyWith(
                fontSize: 12,
                color: const Color(0xFF7D8699),
              ),
            ),
            InputText(
              onChanged: (value) {},
              type: TextInputType.text,
              hintText: 'Andrews',
              controller: _lastNameController,
            ),
            const SizedBox(height: 20),
            Text(
              'PHONE NUMBERS',
              style: AppStyles.medium.copyWith(
                fontSize: 12,
                color: const Color(0xFF7D8699),
              ),
            ),
            InputText(
              onChanged: (value) {},
              type: TextInputType.number,
              hintText: '426-980-0043',
              controller: _phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
