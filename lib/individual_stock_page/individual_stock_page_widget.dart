import '../components/buy_sell_call_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualStockPageWidget extends StatefulWidget {
  IndividualStockPageWidget({
    Key key,
    this.artPiece,
  }) : super(key: key);

  final dynamic artPiece;

  @override
  _IndividualStockPageWidgetState createState() =>
      _IndividualStockPageWidgetState();
}

class _IndividualStockPageWidgetState extends State<IndividualStockPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.secondaryColor,
            size: 24,
          ),
        ),
        title: Text(
          'INDEX',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.secondaryColor,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 50,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'StockName',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                height: 30,
                                thickness: 0.9,
                                color: FlutterFlowTheme.primaryColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  'previousClose',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                '\$.price',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF303030),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: AutoSizeText(
                                    'currentPrice',
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  '\$.price',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 30,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: FlutterFlowTheme.primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'High',
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  '\$.price',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'Low',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF303030),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  '\$.price',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 30,
                          thickness: 1,
                          indent: 10,
                          endIndent: 1,
                          color: FlutterFlowTheme.primaryColor,
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  'Volume',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                'vol. amt.',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF303030),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: AutoSizeText(
                                    'Dividend Yeild',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF303030),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  'value',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 30,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: FlutterFlowTheme.primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    'Market cap',
                                    style: FlutterFlowTheme.subtitle1.override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF303030),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  '\$.price',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Open Sans',
                                    color: Color(0xFF303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 30,
                          thickness: 1,
                          indent: 10,
                          endIndent: 1,
                          color: FlutterFlowTheme.primaryColor,
                        )
                      ],
                    ),
                    BuySellCallWidget(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.primaryColor,
                                child: Align(
                                  alignment: Alignment(0, 0),
                                  child: RatingBarIndicator(
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_sharp,
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: 5,
                                    unratedColor: Color(0xFF9E9E9E),
                                    itemCount: 7,
                                    itemSize: 35,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment(0.9, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Invest',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.tertiaryColor,
                                    textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 69,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.secondaryColor,
                border: Border.all(
                  color: Color(0xFF000003),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'HomeIndexPage'),
                          ),
                        );
                      },
                      text: '',
                      icon: Icon(
                        Icons.home_rounded,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 50,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment(0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Add to WatchList',
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 200,
                          height: 38,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle1.override(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 6,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'MyWatchList'),
                          ),
                        );
                      },
                      text: '',
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 50,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
