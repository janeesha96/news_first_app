import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_first_app/providers/dashboardProvider.dart';
import 'package:news_first_app/utilities/HexColor.dart';
import 'package:provider/provider.dart';

import '../../../utilities/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utilities/CustomTextStyle.dart';
import 'categoryView.dart';
import 'detailView.dart';
import 'newsListView.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  bool isLoading = false;
  List<int> items = [
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    8,
  ];
  int _selectedTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        isLoading = true;
      });
      final ind =
          Provider.of<DashboardProvider>(context, listen: false).tabIndex;
      tabController.animateTo(ind);
      _selectedTabIndex = ind;
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),

                      autofocus: false,
                      cursorColor: Colors.black,
                      textInputAction: TextInputAction.search,
                      onChanged: (val) {
                        dashboardProvider.setSearchString(val.toLowerCase());
                        // setState(() {
                        //   complaintsAppDashboardProvider.complaintsList =
                        //       complaintsAppDashboardProvider.complaintsList
                        //           .where((element) {
                        //     var complaintsTitle = element.title.toLowerCase();
                        //     var storeName = element.store.code.toLowerCase();
                        //     var pcNo = element.pcNo.toString();
                        //     var caseNo = element.caseNo.toString();
                        //     var staffName = element.staffName.toLowerCase();

                        //     return complaintsTitle.contains(val.toLowerCase()) ||
                        //         storeName.contains(val.toLowerCase()) ||
                        //         pcNo.contains(val) ||
                        //         caseNo.contains(val) ||
                        //         staffName.contains(val.toLowerCase());
                        //   }).toList();

                        // });

                        // if (dashboardProvider.searchString == '') {
                        //   _getComplaintsListData();
                        // }
                      },
                      // onFieldSubmitted: (val) {
                      //   complaintsAppDashboardProvider
                      //       .setSearchString(val.toLowerCase());
                      //  // FocusScope.of(context).unfocus();
                      // },
                      decoration: InputDecoration(
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Dogecoin to the Moon..",
                          suffixIcon: IconButton(
                              onPressed: () {
                                dashboardProvider.isSearchModeOn
                                    ? dashboardProvider
                                        .toggleAppbarSearchMode(false)
                                    : dashboardProvider
                                        .toggleAppbarSearchMode(true);
                              },
                              icon: dashboardProvider.isSearchModeOn
                                  ? const Icon(
                                      Icons.search_rounded,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Visibility(
                    visible: dashboardProvider.isSearchModeOn,
                    child: CircleAvatar(
                      backgroundColor: HexColor(AppColors.mainColor),
                      radius: 20,
                      child: SvgPicture.asset('assets/images/notification.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: dashboardProvider.isSearchModeOn,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Latest News",
                          style: CustomTextStyle(context)
                              .headlineBlack()
                              .copyWith(
                                  color: HexColor(AppColors.primaryColor)),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NewsListView()));
                          },
                          child: Row(
                            children: [
                              Text('See All',
                                  style: CustomTextStyle(context).blueText()),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 230,
                      width: width,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailView()));
                              },
                              child: SizedBox(
                                height: 230,
                                width: 300,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.amber,
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      height: kToolbarHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Consumer<DashboardProvider>(
                          builder: (context, provider, child) => TabBar(
                              controller: tabController,
                              isScrollable: true,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2),
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: HexColor(AppColors.mainColor)),
                              onTap: (idx) {
                                setState(() {
                                  _selectedTabIndex = idx;

                                  provider.setTabIndex(idx);
                                });
                              },
                              tabs: const [
                                Tab(
                                  text: 'Healthy ',
                                ),
                                Tab(
                                  text: 'Technology ',
                                ),
                                Tab(
                                  text: 'Finance ',
                                ),
                                Tab(
                                  text: 'Arts ',
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: CategoryView())
            ],
          ),
        ),
      ),
    );
  }
}
