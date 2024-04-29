import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/view_team_bloc/view_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/team_card.dart';
import 'package:fantabasket_app_flutter/utils/bazier_container.dart';
import 'package:fantabasket_app_flutter/utils/custom_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdfx/pdfx.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthenticatedState).user;
    final darkMode = Provider.of<DarkThemeProvider>(context);
    final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/regolamento.pdf'),
);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child:  Stack(
        children: [
          Positioned(
                top: -MediaQuery.of(context).size.height * .24,
                right: -MediaQuery.of(context).size.width * .1,
                child: const BezierContainer()),
          Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                
                child:
                       Column(
                          children: [
                            
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(50.0)),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset(
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    'assets/images/player.jpeg',
                                  ),
                                ),
                              ),
                            
                            const SizedBox(height: 30,),
                             Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.bottomLeft,
                               child: Text(
                                  '${user.firstName} ${user.lastName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: darkMode.darkTheme
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                                  ),
                                ),
                             ),
                            
                            
                          ],
                        ),
                        
              ),
              
              
             
             
              SizedBox(
                  height: 54,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.moon,
                              color: darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                          const SizedBox(width: 10),
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: darkMode.darkTheme
                                    ? CupertinoColors.white
                                    : CupertinoColors.black),
                          ),
                          const Spacer(),
                          CupertinoSwitch(
                            activeColor: Theme.of(context).colorScheme.background,
                            value: darkMode.darkTheme,
                            onChanged: (value) {
                              darkMode.darkTheme = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                
              
              ),
              
                SizedBox(
                  height: 54,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.doc_text,
                              color: darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                          const SizedBox(width: 10),
                          Text(
                            'Regolamento',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: darkMode.darkTheme
                                    ? CupertinoColors.white
                                    : CupertinoColors.black),
                          ),
                          const Spacer(),
                                                GestureDetector(onTap: () {
                                                  showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: ((modalContext) =>
                                            CustomBaseBottomSheet(
                                              title:
                                                  'Regolamento',
                                              body:
                                                  PdfView(
  controller: pdfController,
),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.85,
                                            )));
                                                },child: Icon(CupertinoIcons.chevron_right, color:  darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,))
          
                        ],
                      ),
                    ),
                  ),
                
              ),
              SizedBox(
                  height: 54,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.output,
                              color: darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                          const SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: darkMode.darkTheme
                                    ? CupertinoColors.white
                                    : CupertinoColors.black),
                          ),
                          const Spacer(),
                          GestureDetector(onTap: ()=> context.read<AuthCubit>().manualLogout(),child: Icon(CupertinoIcons.chevron_right, color:  darkMode.darkTheme
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,))
                        ],
                      ),
                    ),
                  ),
                
              ),
              
            ],
          ),
        ],
      )
    );
  }
}
