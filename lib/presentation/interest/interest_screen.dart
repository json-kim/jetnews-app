import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/interest/data/interest_data.dart';
import 'package:jet_news_app/presentation/interest/interest_event.dart';
import 'package:jet_news_app/presentation/interest/interest_view_model.dart';
import 'package:jet_news_app/presentation/widget/news_drawer.dart';
import 'package:provider/provider.dart';

import 'components/interest_list_tile.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.microtask(() {
      final viewModel = context.read<InterestViewModel>();

      _subscription = viewModel.uiStream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<InterestViewModel>();
    final state = viewModel.state;
    final interestSet = state.interestSet;

    final Widget body;
    if (state.isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (interestSet == null) {
      body = Center(
        child: IconButton(
          onPressed: () {
            viewModel.onEvent(const InterestEvent.loadInterest());
          },
          icon: const Icon(Icons.refresh),
        ),
      );
    } else {
      body = _buildBody(viewModel, interestSet);
    }

    return Scaffold(
      drawer: const NewsDrawer(),
      appBar: AppBar(
        title: const Text('Interest'),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list_alt),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {},
          tabs: const [
            Tab(text: 'Topics'),
            Tab(text: 'People'),
            Tab(text: 'Publications'),
          ],
        ),
      ),
      body: body,
    );
  }

  Widget _buildBody(InterestViewModel viewModel, InterestSet interestSet) {
    return TabBarView(
      controller: _tabController,
      children: [
        // Topic 리스트뷰
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...interestSet.interestSections
                .map(
                  (section) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 섹션 타이틀
                      Text(
                        section.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 16),

                      // 섹션 리스트타일
                      ...section.interests
                          .map(
                            (interest) => InterestListTile(
                              interestData: interest,
                              onTap: () {
                                viewModel.onEvent(
                                    InterestEvent.checkInterest(interest));
                              },
                            ),
                          )
                          .toList(),
                      const SizedBox(height: 16),
                    ],
                  ),
                )
                .toList(),
          ],
        ),

        // People 리스트뷰
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...interestSet.peopleInterests
                .map((interest) => InterestListTile(
                    interestData: interest,
                    onTap: () {
                      viewModel.onEvent(InterestEvent.checkInterest(interest));
                    }))
                .toList(),
          ],
        ),

        // Publication 리스트뷰
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...interestSet.pubInterests
                .map((interest) => InterestListTile(
                    interestData: interest,
                    onTap: () {
                      viewModel.onEvent(InterestEvent.checkInterest(interest));
                    }))
                .toList(),
          ],
        ),
      ],
    );
  }
}
