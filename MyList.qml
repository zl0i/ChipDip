import QtQuick 2.11
import QtQuick.Controls 2.4

SwipeView {
    anchors.fill: parent
    signal openTable(var table)
    property alias model: _elementview.model
    ListView {
        id: _elementview

        delegate: Rectangle {
            id: _rect
            anchors.topMargin: 5
            width: _elementview.width
            height: 50
            color: "white"
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
                    openTable(_text.text)
                }
                onPositionChanged: {
                     _rect.color = "white"
                }

            }
            Text {
                id: _text
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                color: "black"
                text: modelData
                font.pixelSize: 18
            }
        }
    }
}
