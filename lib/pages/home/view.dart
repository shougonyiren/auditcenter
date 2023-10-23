import 'package:auditcenter/common/values/colors.dart';
import 'package:auditcenter/common/values/shadows.dart';
import 'package:auditcenter/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomeLogic());

  // 顶部导航
  AppBar _buildAppBar() {
    return AppBar(
        title:  Text(
          '审核',
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),elevation: 4,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.search,
        //       color: AppColors.primaryText,
        //     ),
        //     onPressed: () {},
        //   )
        // ]
    );
  }

  // 内容页
  Widget _buildPageView() {
    return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getLeftButton('nbc','按钮1'),
              getLeftButton('nbc','按钮2'),
              getLeftButton('nbc','按钮3'),
            ],
          ),
          Expanded(
            child: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Text('BookmarksPage'),
              Text('AccountPage'),
            ],
            controller: controller.pageController,
            onPageChanged: controller.handlePageChanged,
    ),
          ),],
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
    );
  }

  getLeftButton(code,title){
    return Container(
      width: 72.w,
      height: 72.w,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 图标
            Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: Image.asset(
                "assets/images/channel-${code}.png",
                fit: BoxFit.cover,
              ),
            ),
            // 标题
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  height: 14.sp / 14,
                ),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
