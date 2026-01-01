import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/views/feed_page/components/comment_header.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_header.dart';

class PuddingInquiryWatchPage extends StatefulWidget {
  const PuddingInquiryWatchPage({super.key});

  @override
  State<PuddingInquiryWatchPage> createState() =>
      _PuddingInquiryWatchPageState();
}

class _PuddingInquiryWatchPageState extends State<PuddingInquiryWatchPage> {
  final DateTime dateTime = DateTime.now();

  String get dateTimeFormat => DateFormat('yyyy-MM-dd').format(dateTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '문의',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Symbols.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: PuddingInquiryHeader(
                    title: '메시아적 시간',
                    userId: '최승우',
                    userImage: PuddingAssets.profile,
                    content:
                        '에 따라붙을 어떠한 매혹적인 이미지도 영화의 디제시스의 장에 덧붙여지지 않는다. 여기서 메시아적 시간을 이렇게 상상해보자. 영국군 또는 테러리스트들이 전투를 벌이는 장면은 다르게는 시간의 주도권을 둔 싸움일 것이다. 누가 오래 버틸 것이며, 누가 승산을 쥘 것인가. 이게 비해 자신을 지킬 변변한 무기 하나 없는 주인공에게 시간은 결코 자신의 편이 아니었다. 그러나 앞서 묘사한 이 마술적인 순간을 통해 잠시나마 시간은 구부러져 전적으로 주인공 편으로 스며든다. 아기와 주인공은 무사히 탈출하고, 이 마술적 순간을 끝으로 다시 전투의 시간은 이어진다. 크로노스에 침투해 그것을 절단하는 이 시간을 메시아적인 순간이라고 부를 수는 없을까. 방금 <칠드런 오브 맨>을 예로 들었지만, 묵시록 텍스트와 메면,',
                    date: dateTimeFormat,
                    admin: true,
                  ),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: PuddingColor.brown),
            const SizedBox(
              height: 47,
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: PuddingCommentHeader(
                            userId: '관리자',
                            userImage: PuddingAssets.admin,
                            content: '안녕하세요',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
