import 'package:al_gamal_al_massi/core/app_theme/app_colors.dart';
import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/cache_helper/shared_pref_methods.dart';
import '../../../view_model/chat_cubit/chat_cubit.dart';
import '../../widgets/chat_widgets/message_widget.dart';

class ConversationScreen extends StatefulWidget {
  final String? receiverId;
  final String? userName;

  const ConversationScreen({super.key,  this.receiverId,  this.userName});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final TextEditingController messageController = TextEditingController();

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
                  widget.userName??"",
                  style:
                      CustomThemes.primaryTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Row(
                //   children: [
                //     const CircleAvatar(
                //       radius: 4,
                //       backgroundColor: Colors.green,
                //     ),
                //     const CustomSizedBox(
                //       width: 8,
                //     ),
                //     Text(
                //       "Online",
                //       style: CustomThemes.primaryTextColorTextTheme(context)
                //           .copyWith(
                //         fontSize: 14.sp,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
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
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Column(
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
                child: StreamBuilder(
                    stream: ChatCubit.get(context)
                        .getChatMessages(receiverId: widget.receiverId??""),
                    builder: (context, snapshot) {
                      List<Map<String, dynamic>> chats = snapshot.data ?? [];
                      chats = chats.reversed.toList();
                      return ListView.separated(
                        reverse: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        itemCount: chats.length,
                        separatorBuilder: (_, index) {
                          return const CustomSizedBox(
                            height: 16,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return MessageItemWidget(
                            isMyMessage: chats[index]["senderId"] !=
                                    CacheHelper.getData(key: "userId")
                                ? false
                                : true,
                            message: chats[index]["message"],
                          );
                        },
                      );
                    }),
              ),
              const CustomSizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Type Message",
                      borderRadiusValue: 32,
                      controller: messageController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if(messageController.text.trim().isNotEmpty){
                         ChatCubit.get(context).sendMessage(
                          receiverId: widget.receiverId??"",
                          message: messageController.text.trim(),
                        );
                        messageController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: AppColors.primaryColor),
                    child: const Icon(
                      Icons.send,
                      color: AppColors.whiteColor,
                    ),
                  )
                ],
              ).onlyDirectionalPadding(start: 16),
              const CustomSizedBox(
                height: 32,
              ),
            ],
          );
        },
      ),
    );
  }
}
