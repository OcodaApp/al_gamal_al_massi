import 'package:al_gamal_al_massi/core/assets_path/images_path.dart';
import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../widgets/shared_widget/custom_text_form_field.dart';

class MyChatsScreen extends StatelessWidget {
  const MyChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Chat",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
            width: double.infinity,
            child: CustomTextField(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              filled: true,
              fillColor: AppColors.whiteColor,
              hintText: "Search for",
              prefixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  SvgPath.search,
                  width: 18.w,
                  height: 18.h,
                ),
                style: IconButton.styleFrom(padding: EdgeInsets.zero),
              ),
            ),
          ).symmetricPadding(
            horizontal: 16,
            vertical: 16,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 32.h,
            ),
            itemBuilder: (_, index) {
              return ChatItemWidget(
                userName: "Mohamed",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ConversationScreen(),
                    ),
                  );
                },
              );
            },
            itemCount: 10,
          ))
        ],
      ),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  final String userName;
  final void Function()? onTap;

  const ChatItemWidget({
    super.key,
    required this.userName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffF0F0F0),
          width: 2,
        ),
      ),
      leading: Stack(
        alignment: AlignmentDirectional.bottomEnd,
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
          Container(
            height: 16.h,
            width: 16.w,
            margin: EdgeInsetsDirectional.only(end: 2.w, bottom: 2.h),
            padding: EdgeInsets.all(2.sp),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      title: Text(
        userName,
        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "okay sure!!",
        style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "12:25 PM",
            style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.done_all,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 10.w,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  "3",
                  style: CustomThemes.whiteTextColorTextTheme(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
