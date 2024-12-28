import 'package:al_gamal_al_massi/core/assets_path/images_path.dart';
import 'package:al_gamal_al_massi/core/cache_helper/shared_pref_methods.dart';
import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/conversation_screen.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:al_gamal_al_massi/view_model/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
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
          style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
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
          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Expanded(
                child: StreamBuilder(
                    stream: ChatCubit.get(context).getUsers(),
                    builder: (context, snapshot) {
                      ConnectionState connectionStat = snapshot.connectionState;
                      List<Map<String, dynamic>> users = snapshot.data ?? [];
                      users = users
                          .where((element) =>
                              element["userId"] !=
                              CacheHelper.getData(key: "userId"))
                          .toList();
                      if (connectionStat == ConnectionState.active) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 32.h),
                          itemBuilder: (_, index) {
                            return ChatItemWidget(
                              userName: users[index]["userName"],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ConversationScreen(
                                      userName: users[index]["userName"],
                                      receiverId: users[index]["userId"],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (_, index) {
                            return const Divider(
                              thickness: 1,
                            ).symmetricPadding(vertical: 8);
                          },
                          itemCount: users.length,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  final String userName;
  final void Function()? onTap;

  const ChatItemWidget({super.key, required this.userName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
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
                margin: EdgeInsetsDirectional.only(end: 2.w, bottom: 2.h),
                width: 16.w,
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
          const CustomSizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style:
                      CustomThemes.primaryTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "okay sure!!",
                //   style:
                //       CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
              ],
            ),
          ),
          const CustomSizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "12:25 PM",
                style:
                    CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // const Icon(
              //   Icons.done_all,
              //   color: Colors.black,
              // )
            ],
          ),
          const CustomSizedBox(
            width: 8,
          ),
          // CircleAvatar(
          //   radius: 10.w,
          //   backgroundColor: AppColors.primaryColor,
          //   child: Text(
          //     "3",
          //     style: CustomThemes.whiteTextColorTextTheme(context).copyWith(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 12.sp,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
