import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window {
    width: 400
    height: 200
    minimumHeight: 200
    minimumWidth: 400
    maximumHeight: 200
    maximumWidth: 400
    x: 100
    y:100
    visible: true
    title: qsTr("Qml Runner")
    color: "#f1f2f0"


    MainView {
        id:mainView
        anchors.fill: parent
        visible: true
    }

}

