import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/model/card_model.dart';
import 'package:flutter_bottom_navigation/utils/text_styles.dart';
import 'package:flutter_bottom_navigation/widgets/card_item.dart';
class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  return CardItem(
                    card: cardsList[index],
                  );
                }),
          ),
        ),
      ],
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      snap: true,
      floating: true,
      elevation: 10,
      backgroundColor: Colors.white,
      expandedHeight: 60,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(40),
      //         bottomRight: Radius.circular(40))),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text("Card Details",
            style: AppTextStyles.boldSmallTextStyle),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                              radius: 17,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.black,
                              ))),
        ),
      ],
      // flexibleSpace: FlexibleSpaceBar(
      //   background: ClipRRect(
      //       borderRadius:
      //       const BorderRadius.vertical(bottom: Radius.circular(40)),
      //       child: Row(
      //         children: const [
      //           Spacer(),
      //           Expanded(
      //               child: Text("Card Details",
      //                   style: AppTextStyles.boldTextStyle)),
      //           Expanded(
      //             child: CircleAvatar(
      //                 radius: 18,
      //                 backgroundColor: Colors.grey,
      //                 child: CircleAvatar(
      //                     radius: 17,
      //                     backgroundColor: Colors.white,
      //                     child: Icon(
      //                       Icons.credit_card,
      //                       color: Colors.black,
      //                     ))),
      //           ),
      //         ],
      //       )),
      // ),
    );
  }
}