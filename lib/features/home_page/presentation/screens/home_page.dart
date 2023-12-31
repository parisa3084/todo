import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home_page/presentation/bloc/status.dart';
import 'package:todo_app/features/home_page/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/home_page/presentation/bloc/todo_state.dart';
import 'package:todo_app/features/home_page/presentation/widgets/card_widget.dart';
import 'package:todo_app/features/home_page/presentation/widgets/day.dart';
import 'package:todo_app/features/home_page/presentation/widgets/day_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Day> days = const <Day>[
    Day(
        cardColor: Colors.green,
        textColor: Colors.white,
        day: "Sun",
        date: "28"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Mon",
        date: "1"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Tue",
        date: "2"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Wed",
        date: "3"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Thu",
        date: "4"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Fri",
        date: "5"),
    Day(
        cardColor: Colors.white,
        textColor: Colors.black,
        day: "Sat",
        date: "6"),
  ];

  @override
  void initState() {
    BlocProvider.of<ToDoBloc>(context).add(LoadToDoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ToDoBloc, ToDoState>(buildWhen: (previous, current) {
        if (previous.status == current.status) {
          return false;
        }
        return true;
      }, builder: (context, state) {
        if (state.status is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status is Error) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(Icons.error, color: Colors.white, size: 35),
          );
        }

        if (state.status is Completed) {
          final Completed cwComplete = state.status as Completed;
          return Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      )),
                  const Text(
                    "Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Divider(
                thickness: 2,
              ),
              Container(
                height: 90,
                margin: const EdgeInsets.only(left: 10),
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DayWidget(
                      day: days[index].day,
                      date: days[index].date,
                      cardColor: days[index].cardColor,
                      textColor: days[index].textColor,
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sunday",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "28 Feb,2021",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cwComplete.todo.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return   CardWidget(data: cwComplete.todo.data![index], isDefault:  index == 0 ? true : false,);
                  },
                ),
              ),

            ],
          );
        }

        return Container();
      }),
    ));
  }
}
