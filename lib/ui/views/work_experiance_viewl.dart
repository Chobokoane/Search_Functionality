import 'package:filter/core/enums/viewstate.dart';
import 'package:filter/core/model/qualifications_model.dart';
import 'package:filter/core/viewmodels/qualifications_viewmodel.dart';
import 'package:filter/core/viewmodels/work_experience_viewmodel.dart';
import 'package:filter/ui/shared/app_colors.dart';
import 'package:filter/ui/shared/text_styles.dart';
import 'package:filter/ui/widgets/padded_divider_widget.dart';
import 'package:filter/ui/widgets/search_filter_widget.dart';
import 'package:filter/ui/widgets/uploading_documents_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class WorkExperienceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    print("aspectRatio: $aspectRatio");
    return BaseView<WorkExperienceViewModel>(
      onModelReady: (model) {
        model.getWorkExperienceList();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: widgetBgColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: widgetLightGreyColor,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: widgetGreyColor, //change your color here
          ),
          title: Text(
            "Work Experience",
            style: TextStyle(color: textColorWhite),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  model.workExperiencesList.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: model.workExperiencesList == null
                                ? 0
                                : model.filteredWorkExperienceList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: widgetLightGreyColor1,
                                child: new ListTile(
                                  title: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${model.filteredWorkExperienceList[index].company} ',
                                        style: styleBlack,
                                      ),
                                      Text(
                                          '${model.filteredWorkExperienceList[index].position}'),
                                      Text(
                                          '${model.filteredWorkExperienceList[index].duration}'),

                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: widgetLightGreyColor1,
                        child: Text("Add Work Experince",style: greyText,),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'addWorkExperience');
                        },
                      ),
                      Container(

                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: widgetLightGreyColor1,
                          child: Text("Skip",style: greyText,),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, 'document');
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
