import QtQuick
import QtQuick.Controls
import processor.h



Item {
    id: items

    Timer {
        id: timer
        interval: 3300
        onTriggered: {
            runFile.enabled = true
              runFile.font.pointSize = 18
            runFile.text = qsTr("<html><font color='green'><b>Run</b></font><i> Qml File</i></html>")
        }
    }

    Processor {
        id: myProcessor
        onRunChanged: {
            path.text = run
            if(path.text !== "Erorr: Not Qml File"){
                path.font.pointSize = 10
                path.color = "green"
                runFile.enabled = true
                runFile.enabled = true
            }else {
                path.font.pointSize = 14
                runFile.enabled = false
                path.color = "red"
            }
        }

    }

    TextInput {
        id:path

        readOnly: true
        cursorVisible: false
        text: qsTr("")
        font {
            bold: true
            italic: true
            pointSize: 10
        }
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            margins: 15
        }
        color: "green"

    }
    Button {
        id:openFile

        text: qsTr("<html><font color='green'><b>Open</b></font><i> Qml File</i></html>")

        background: Rectangle {
            id:backgroundRec
            implicitHeight: 40
            implicitWidth: 100
            opacity: enabled ? 1 : 0.3
            color: "#edd8d8"
            border.color: openFile.down ? "green" : "#edd8d8"
            border.width: 3
            radius: 10
        }

        anchors {
            top: path.top
            left: parent.left
            right: parent.right
            leftMargin: 100
            rightMargin: 100
            topMargin: 30
        }
        font {
            italic: true
            pointSize: 18
        }

        onReleased: {
            myProcessor.open()
        }

    }

    Button {
        id:runFile

        enabled: false
        text: qsTr("<html><font color='green'><b>Run</b></font><i> Qml File</i></html>")

        background: Rectangle {
            id:backgroundRec2
            implicitHeight: 40
            implicitWidth: 100
            opacity: enabled ? 1 : 0.3
            color: "#edd8d8"
            border.color: runFile.down ? "green" : "#edd8d8"
            border.width: 3
            radius: 10
        }

        anchors {
            top: openFile.bottom
            left: openFile.left
            right: openFile.right
            topMargin: 25
        }
        font {
            italic: true
            pointSize: 18
        }

        onReleased: {
            myProcessor.start()
            enabled = false
            timer.start()
            runFile.font.pointSize = 12
            runFile.text = qsTr("<html><font color='green'><b>Loading</b></font><i> Please Wait</i></html>")
        }

    }

}
