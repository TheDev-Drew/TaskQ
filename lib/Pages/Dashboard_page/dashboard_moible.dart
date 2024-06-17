import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:task_app/Pages/Settings_page/settings_page.dart';
import 'package:task_app/components/my_card.dart';
import 'package:task_app/components/task_holder.dart';
import 'package:task_app/info/quotes.dart';
import 'package:task_app/services/firestore.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  final FirestoreService firestoreService = FirestoreService();

  final List<String> dayS_ = [
    "SUN",
    "MON",
    "TUES",
    "WED",
    "THUR",
    "FRI",
    "SAT",
  ];

  int dayOfTheWeek = DateTime.now().weekday % 7;

  String selected() {
    return dayS_[dayOfTheWeek];
  }

  // Scroll method for days of the week
  final ScrollController _scrollController = ScrollController();
  void scroll() {
    if (dayOfTheWeek > 3) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    }
  }

  // changin quotes each day method
  final Quotes quotes = Quotes();
  String tQuote() {
    return quotes.dailyquotes[dayOfTheWeek];
  }

  @override
  void initState() {
    super.initState();
    selected();
    tQuote();
    scroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void openTaskBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 20,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        scrollable: true,
        content: TextField(
          maxLines: 2,
          style: const TextStyle(fontSize: 30, height: 1),
          controller: _titleController,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "What's todays task?"),
        ),
        actions: [
          // Button to close
          MaterialButton(
            disabledTextColor: Theme.of(context).colorScheme.tertiary,
            color: Theme.of(context).colorScheme.surface,
            onPressed: () {
              if (docID == null) {
                firestoreService.addTask(
                    _titleController.text, _contentController.text);
              } else {
                firestoreService.updateTask(
                    docID, _titleController.text, _contentController.text);
              }
              // Clear controllers
              _titleController.clear();

              Navigator.pop(context);
            },
            child: const Text("Create Task"),
          )

          // Button to save
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Icon(
                            Icons.person,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              Text(
                                "To TaskQ",
                                style: TextStyle(
                                    height: 0,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Quote",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 120,
                          child: Text(
                            tQuote(),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.6),
                                fontSize: 26,
                                height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Days of the week
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 115,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: dayS_.length,
                        itemBuilder: (context, index) {
                          return MyCard(
                            text: dayS_[index],
                            isSelected: dayS_[index] == selected(),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Tasks",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const MobileNewTaskPage()),
                            // );

                            openTaskBox();
                          },
                          child: Container(
                            height: 55,
                            width: 135,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Create New Task",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 358,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: firestoreService.getTaskStream(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text("Something went wrong"));
                            }
                            if (!snapshot.hasData) {
                              return const Center(child: Text("No Tasks"));
                            }
                            List taskList = snapshot.data!.docs;

                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: taskList.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot document = taskList[index];
                                String docID = document.id;

                                Map<String, dynamic> data =
                                    document.data() as Map<String, dynamic>;
                                String taskTitle = data["taskTitle"];
                                String taskDetail = data["taskDetail"];

                                return SingleChildScrollView(
                                  child: ListTile(
                                    title: TaskHolder(
                                      ontap_: () =>
                                          firestoreService.deleteTask(docID),
                                      title: taskTitle,
                                      content: taskDetail,
                                      isSelected: false,
                                      ontap: () {
                                        openTaskBox(docID: docID);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const MobileNewTaskPage()),
                                        // );
                                        firestoreService.updateTask(
                                            docID, taskTitle, taskDetail);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Positioned(
                      left: 75,
                      right: 75,
                      bottom: 25,
                      child: Center(
                        widthFactor: 4,
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 30),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MobileDashboard()),
                                  );
                                },
                                icon: const Icon(Icons.home),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MobileSettingsPage()),
                                  );
                                },
                                icon: const Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ),
                      ),
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
