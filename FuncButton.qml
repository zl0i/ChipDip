import QtQuick 2.4
import QtQuick.Controls 2.4


Button {
    property alias color: _back.color
    property alias source: _img.source   
    width: 50
    height: 50
    Image {
        id: _img
        anchors.fill: parent
        anchors.margins: 10
        antialiasing: true
        mipmap: true

        NumberAnimation {
            id: _animImg
            target: _img
            property: "rotation"
            from: 0
            to: 180
            duration: 200
            easing.type: Easing.InQuint
            running: false
        }
    }

    background: Rectangle {
        id: _back
        color: "#FF0000"
        radius: 50
    }
    onPressed:  {
        y = y + 5
        anchors.rightMargin = anchors.rightMargin + 5
        anchors.bottomMargin = anchors.bottomMargin + 5
        width = 40
        height = 40

    }
    onReleased: {
        y = y - 5
        anchors.rightMargin = anchors.rightMargin - 5
        anchors.bottomMargin = anchors.bottomMargin - 5
        width = 50
        height = 50
    }

    function startAnimationImage() {
        _animImg.start()

    }
}
