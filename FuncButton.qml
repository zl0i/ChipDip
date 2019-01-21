import QtQuick 2.4
import QtQuick.Controls 2.4


Button {
    property alias color: _back.color
    width: 50
    height: 50

    background: Rectangle {
        id: _back
        color: "#FF0000"
        radius: 50
    }
    onPressed:  {
        leftPadding = 5
        topPadding = 5
        width = 40
        height = 40

    }
    onReleased: {
        leftPadding = 0
        topPadding = 0
        width = 50
        height = 50
    }
}
