import 'package:al_gamal_al_massi/core/app_theme/app_colors.dart';
import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/chat_widgets/message_widget.dart';
import '../../widgets/shared_widget/custom_text_form_field.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                ImagesPath.map,
                fit: BoxFit.cover,
              ),
            ),
            const CustomSizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohamed",
                  style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green,
                    ),
                    const CustomSizedBox(
                      width: 8,
                    ),
                    Text(
                      "Online",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          const CustomSizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              itemCount: 10,
              separatorBuilder: (_, index) {
                return const CustomSizedBox(
                  height: 16,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return MessageItemWidget(
                  isMyMessage: index % 2 == 0,
                );
              },
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Expanded(
                child: CustomTextField(
                  hintText: "Type Message",
                  borderRadiusValue: 32,
                ),
              ),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: AppColors.primaryColor),
                child: const Icon(
                  Icons.send,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          ),
          const CustomSizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
