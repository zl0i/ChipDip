import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Window 2.3
//import QtWebView 1.1

import WorkDatabase 1.0

ApplicationWindow {
    id: _app
    visible: true
    width: 320
    height: 640
    title: qsTr("Chip Dip")

    WorkDatabase {
        id: _workdb
    }

    Item {
        anchors.fill: parent
        SwipeView {
            id: _swipeView
            currentIndex: 0
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height - 50
            Page {
                property string name: "Элементы"
                property string image_scr: "qrc:/image/new_table.png"
                ElementView {
                    anchors.fill: parent

                }



            }
            Page {
                property string name: "Проекты"
                property string image_scr: "qrc:/image/new_proj.png"
                ProjectView {
                   anchors.fill: parent
                }

            }
            Page {
                property string name: "Сайт"
                property string image_scr: "qrc:/image/site.png"
                /*WebView {
                    id: _webview
                    anchors.fill: parent
                    url: "https://www.chipdip.ru"


                }*/
            }
            Page {
                property string name: "Настройки"
                property string image_scr: "qrc:/image/settings.png"
                Label {
                    anchors.centerIn: parent
                    text: "Settings"
                }

            }
        }
        PageIndicator {
            id: _indicator
            topPadding: 0
            rightPadding: 0
            leftPadding: 0
            anchors.top: _swipeView.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 0
            currentIndex: _swipeView.currentIndex
            width: _app.width


            count: _swipeView.count
            delegate: Rectangle {

                width: _indicator.width/_indicator.count
                height: _indicator.height
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        parent.color = "red"
                    }
                    onReleased: {
                        parent.color = "white"
                        _swipeView.currentIndex = index

                    }
                }
                Image {
                    id: _img
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: _lbl.top
                    anchors.bottomMargin: 5
                    width: height

                    clip: true
                    mipmap: true

                    source:  _swipeView.itemAt(index).image_scr


                }

                Label {
                    id: _lbl
                    anchors.bottom: parent.bottom
                    //height: 20
                    anchors.horizontalCenter:  parent.horizontalCenter
                    //anchors.centerIn: parent
                    text: _swipeView.itemAt(index).name
                }
            }
        }
    }

}
