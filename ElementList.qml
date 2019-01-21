import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    anchors.fill: parent
    signal back()
    Button {
        id: _button
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 50
        text: "Назад"
        background: Rectangle {
            color: "white"
        }
        Image {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 25
            height: 25
            source: "qrc:/image/back.png"
        }
        onClicked: {
            back()
        }
    }
    ListView {
        id: _listview
        anchors.top: _button.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        model: _workdb.TableModel
        delegate: Rectangle {
            property bool isOpen: false
            property alias anim: _anim
            id: _rect
            width: parent.width
            height: 50
            clip: true
            NumberAnimation on height {
                id: _anim
                from: 50
                to:100
                duration: 400
                running: false
                easing.type: Easing.InOutQuad
            }
            Rectangle {
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                color: "#F08080"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    _rect.color = "#F08080"
                }
                onReleased: {
                    _rect.color = "white"
                    toogle()

                }
                onPositionChanged: {
                     _rect.color = "white"
                }

            }
            Column {
                id: _clBasictxt
                width: _listview.width
                height: 50
                /*anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter*/
                //height: 50
                spacing: 1
                Text {
                    id: _txtname
                    font.pixelSize: 18
                    text: name
                }
                Text {
                    id: _txtcount
                    text: "Count: " + count
                    font.pixelSize: 10
                }
            }
            Image {
                id: _img
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                rotation: 270
                width: 20
                height: 20
                source: "qrc:/image/back.png"
            }
            SwipeView {
                anchors.top: _clBasictxt.bottom
                anchors.left: _clBasictxt.left
                anchors.right: _clBasictxt.right
                height: 50
                Column {
                    Text {

                        text: "Местонахождение: " + location
                    }
                    Text {
                        text: "URL: " + url
                    }
                    Text {
                        text: "Описание: " + description
                    }
                }
            }
            function toogle() {
                if(isOpen === false) {
                    if(_listview.currentIndex !== -1) {
                        if(_listview.currentItem.isOpen === true) {
                             _listview.currentItem.anim.from = 100
                             _listview.currentItem.anim.to = 50
                             _listview.currentItem.anim.start()
                             _listview.currentItem.isOpen = false
                        }

                        //oldItem.heigt = 40
                    }
                    //_listview.currentItem.height = 40

                    _listview.currentIndex = index
                    _anim.from = 50
                    _anim.to = 100
                    _anim.start()
                    isOpen = true

                }
                else {
                    _listview.currentIndex = -1
                    _anim.from = 100
                    _anim.to = 50
                    _anim.start()
                    isOpen = false
                }
            }

        }
    }
}
