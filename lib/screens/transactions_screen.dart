import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation/model/transaction_item.dart';
import 'package:flutter_bottom_navigation/model/user_profile_item.dart';
import '../model/list_item.dart';
import 'package:flutter_bottom_navigation/utils/text_styles.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  Size? size;
  List<UserProfileItem> userProfile = [
    UserProfileItem(image: "assets/images/user_profile1.png", name: "Anna"),
    UserProfileItem(image: "assets/images/user_profile2.png", name: "Alex"),
    UserProfileItem(image: "assets/images/user_profile3.png", name: "Devid"),
    UserProfileItem(image: "assets/images/user_profile4.png", name: "Kenne"),
    UserProfileItem(image: "assets/images/user_profile5.png", name: "Lana"),
  ];

  List<TransactionItem> transactionList = [
    TransactionItem(
        icon: "assets/images/user_profile1.png",
        name: "Anna",
        amount: "Rs.67",
        time: "22:10"),
    TransactionItem(
        icon: "assets/images/user_profile2.png",
        name: "Alex",
        amount: "Rs.89",
        time: "17:10"),
    TransactionItem(
        icon: "assets/images/user_profile3.png",
        name: "Devid",
        amount: "Rs.110",
        time: "08:09"),
    TransactionItem(
        icon: "assets/images/user_profile4.png",
        name: "Kenne",
        amount: "Rs.99",
        time: "21:10"),
    TransactionItem(
        icon: "assets/images/user_profile5.png",
        name: "Lana",
        amount: "Rs.88",
        time: "19:20"),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(
      //physics: ScrollPhysics(),
      slivers: <Widget>[
        buildSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactionList.length,
                itemBuilder: (context, index) {
                  return buildTransactionItem(index, transactionList);
                }),
          ),
        ),
      ],
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      snap: false,
      pinned: false,
      floating: false,
      elevation: 10,
      backgroundColor: Colors.white,
      expandedHeight: 60,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(40),
      //         bottomRight: Radius.circular(40))),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text("Transactions",
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
                              Icons.filter_list_outlined,
                              color: Colors.black,
                            ))),
        ),
      ],
      // flexibleSpace: FlexibleSpaceBar(
      //   centerTitle: true,
      //   background: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       children: const [
      //         Spacer(),
      //         Expanded(
      //             child: Text("Transactions",
      //                 style: AppTextStyles.boldTextStyle)),
      //         Expanded(
      //           child: CircleAvatar(
      //               radius: 18,
      //               backgroundColor: Colors.grey,
      //               child: CircleAvatar(
      //                   radius: 17,
      //                   backgroundColor: Colors.white,
      //                   child: Icon(
      //                     Icons.filter_list_outlined,
      //                     color: Colors.black,
      //                   ))),
      //         ),
      //       ],
      //     ),
      //   )
      // ),
    );
  }

  Widget buildItem(int index, List<ListItem> list) {
    return Container(
      height: 130,
      width: 110,
      child: Card(
        //elevation: 10,
        semanticContainer: true,
        color: list[index].colors,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: list[index].icons,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                list[index].text!,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionItem(
      int index, List<TransactionItem> transactionList) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(transactionList[index].icon!),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              child: Text(transactionList[index].name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.boldBlackSmallTextStyle,))),
                      SizedBox(width: 5),
                      Container(
                          child: Text(transactionList[index].amount!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.boldBlackSmallTextStyle,))
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Text(transactionList[index].time!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.lightGreyBigTextStyle)),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
