
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:notes_marketing/shared/bloc/bloc_state.dart';
// import 'package:notes_marketing/shared/bloc/cubit.dart';

// class HomeLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => NotsCubit(),
//         child: BlocConsumer<NotsCubit, NotsState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               NotsCubit lay = NotsCubit.get(context);
//               return Scaffold(
//                 appBar: AppBar(
//                   title: Text('NOTS MARKETING'),
//                   leading: Icon(Icons.branding_watermark_outlined),
//                   actions: [
//                     Icon(Icons.menu),
//                   ],
//                 ),
//                 body: null,
//               );
//             }));
//   }
// }
