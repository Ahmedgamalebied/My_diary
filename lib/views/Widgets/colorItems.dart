import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_diary/cubits/add_notes/add_notes_cubit.dart';

class ColorItems extends StatelessWidget {
  const ColorItems({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    if (isActive == true) {
      return CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 23,
          backgroundColor: color,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 24,
        backgroundColor: color,
      );
    }
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

int currentIndex = 0;
List<Color> listColor = const [
  Color(0xff011627),
  Color(0xffFDFFFC),
  Color(0xff2EC4B6),
  Color(0xffE71D36),
  Color(0xffFF9F1C),
  Color(0xffF2F230),
  Color(0xffC2F261),
  Color(0xff61F2C2),
  Color(0xff61F2C2),
  Color(0xff30F2F2),
];

class _ColorListViewState extends State<ColorListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
          itemCount: listColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNotesCubit>(context).color =
                      listColor[index];

                  setState(() {});
                },
                child: ColorItems(
                  color: listColor[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
