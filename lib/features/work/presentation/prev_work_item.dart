
// class WorkItem extends StatefulWidget {
//   final ProjectData projectData;

//   const WorkItem({super.key, required this.projectData});

//   @override
//   State<WorkItem> createState() => _WorkItemState();
// }

// class _WorkItemState extends State<WorkItem>
//     with SingleTickerProviderStateMixin {
//   bool _isHovered = false;
//   late AnimationController _animationController;
//   late Animation<double> _blurAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _blurAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() {
//           _isHovered = true;
//         });
//         _animationController.forward();
//       },
//       onExit: (_) {
//         setState(() {
//           _isHovered = false;
//         });
//         _animationController.reverse();
//       },
//       child: AnimatedBuilder(
//         animation: _blurAnimation,
//         builder: (context, child) {
//           return Card(
//             elevation: _isHovered ? 8 : 2,
//             color: context.colorScheme.surfaceVariant,
//             child: context.isDesktopOrTablet
//                 ? _workItemDesktop(context)
//                 : _workItemMobile(context), 
//           );
//         },
//       ),
//     );
//   }

//   Column _workItemMobile(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: context.width - 100,
//           height: 110 * ((context.width - 100) / 200),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: AnimatedBuilder(
//               animation: _blurAnimation,
//               builder: (context, child) {
//                 return ImageFiltered(
//                   imageFilter: ImageFilter.blur(
//                     sigmaX: _blurAnimation.value,
//                     sigmaY: _blurAnimation.value,
//                   ),
//                   child: Image.asset(
//                     widget.projectData.imagePath,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SeoTexts(
//                 text: widget.projectData.title,
//                 style: context.textStyles.bodyLgBold
//                     .copyWith(color: context.colorScheme.onBackground),
//                 textRendererStyle: TextRendererStyle.header4,
//                 textAlign: TextAlign.left,
//               ),
//               Gap(8),
//               SeoTexts(
//                 text: widget.projectData.description,
//                 maxLines: 4,
//                 overflow: TextOverflow.ellipsis,
//                 style: context.textStyles.bodyMdMedium
//                     .copyWith(color: context.colorScheme.onSurface),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _workItemDesktop(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           // flex: 1,
//           height: 300,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: AnimatedBuilder(
//               animation: _blurAnimation,
//               builder: (context, child) {
//                 return ImageFiltered(
//                   imageFilter: ImageFilter.blur(
//                     sigmaX: _blurAnimation.value,
//                     sigmaY: _blurAnimation.value,
//                   ),
//                   child: Container(
//                     width: double.infinity,
//                     child: Image.asset(
//                       widget.projectData.imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         Container(
//           // flex: 1,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SeoTexts(
//                   text: widget.projectData.title,
//                   style: context.textStyles.titleLgBold.copyWith(
//                     color: context.colorScheme.onBackground,
//                     fontWeight: FontWeight.w900,
//                     letterSpacing: 1.0,
//                     fontSize: 18,
//                   ),
//                   textRendererStyle: TextRendererStyle.header3,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       // backgroundColor: context.colorScheme.primary,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           side: BorderSide(color: AppColors.white))),
//                   onPressed: () {},
//                   child: Text(
//                     'See details -> ',
//                     style: TextStyle(
//                         fontFamily: GoogleFonts.poppins().fontFamily,
//                         color: AppColors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
