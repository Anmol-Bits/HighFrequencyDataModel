import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: qsTr("Live Data View")

    Rectangle {
        anchors.fill: parent
        color: "#f5f6fa"

        ColumnLayout {
            anchors.centerIn: parent
            width: parent.width * 0.9
            height: parent.height * 0.9
            spacing: 16

            Label {
                text: "📊 Live Data"
                font.pointSize: 22
                font.bold: true
                color: "#2c3e50"
                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                radius: 12
                color: "white"
                Layout.fillWidth: true
                Layout.fillHeight: true
                border.color: "#dcdcdc"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    RowLayout {
                        Layout.fillWidth: true
                        height: 40
                        spacing: 0

                        Rectangle {
                            Layout.preferredWidth: 100
                            Layout.preferredHeight: parent.height
                            color: "#f0f0f0"
                            border.color: "#d0d0d0"

                            Label {
                                anchors.centerIn: parent
                                text: "ID"
                                font.bold: true
                            }
                        }

                        Rectangle {
                            Layout.preferredWidth: 200
                            Layout.preferredHeight: parent.height
                            color: "#f0f0f0"
                            border.color: "#d0d0d0"

                            Label {
                                anchors.centerIn: parent
                                text: "Name"
                                font.bold: true
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height
                            color: "#f0f0f0"
                            border.color: "#d0d0d0"

                            Label {
                                anchors.centerIn: parent
                                text: "Value"
                                font.bold: true
                            }
                        }
                    }

                    TableView {
                        id: table
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: tblModel
                        clip: true
                        rowSpacing: 1
                        columnSpacing: 0

                        delegate: Item {
                            implicitHeight: 36
                            implicitWidth: table.width

                            Rectangle {
                                anchors.fill: parent
                                color: TableView.row % 2 === 0 ? "#ffffff" : "#fafafa"
                                border.color: "#e0e0e0"
                                border.width: 1

                                RowLayout {
                                    anchors.fill: parent
                                    spacing: 0

                                    Rectangle {
                                        Layout.preferredWidth: 100
                                        Layout.preferredHeight: parent.height
                                        color: "#f9f9f9"
                                        border.color: "#d0d0d0"

                                        Label {
                                            text: model.id
                                            anchors.centerIn: parent
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }

                                    Rectangle {
                                        Layout.preferredWidth: 200
                                        Layout.preferredHeight: parent.height
                                        color: "#f9f9f9"
                                        border.color: "#d0d0d0"

                                        Label {
                                            text: model.name
                                            anchors.centerIn: parent
                                            horizontalAlignment: Text.AlignLeft
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                            leftPadding: 8
                                        }
                                    }

                                    Rectangle {
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: parent.height
                                        color: "#f9f9f9"
                                        border.color: "#d0d0d0"

                                        Label {
                                            text: Number(model.value).toFixed(2)
                                            anchors.centerIn: parent
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
