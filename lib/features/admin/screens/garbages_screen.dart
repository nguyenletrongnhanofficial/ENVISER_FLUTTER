import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/admin/widgets/item_garbage_admin.dart';
import 'package:uit_hackathon/features/home/widgets/box_challenge.dart';
import 'package:uit_hackathon/features/home/widgets/item_type.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/providers/garbage_provider.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class GarbagesScreen extends StatefulWidget {
  const GarbagesScreen({super.key});

  @override
  State<GarbagesScreen> createState() => _GarbagesScreenState();
}

class _GarbagesScreenState extends State<GarbagesScreen> {
  final List<Map<String, dynamic>> types = [
    {'type': 'Tất cả'},
    {'type': 'Khó phân huỷ'},
    {'type': 'Tái chế'},
    {'type': "Đồ dùng cũ"},
  ];
  String type = 'Tất cả';
    
  @override
  Widget build(BuildContext context) {
    final garbageProvider = context.watch<GarbageProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 56,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Hãy cùng nhau đổi rác vì một hành tinh xanh 🌍',
                    style: AppStyles.semibold,
                  ),
                  const SizedBox(height: 10),
                  // box challenge
                  const BoxChallenge(),
                  const SizedBox(height: 15),
                  SizedBox(
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
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.7 / 1.0),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Garbage garbage = garbageProvider.garbages[index];
                  return GestureDetector(
                    onTap: () {},
                    child: ItemGarbageAdmin(
                      garbage: garbage,
                    ),
                  );
                },
                childCount: garbageProvider.garbages.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
