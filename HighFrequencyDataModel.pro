QT += quick

#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        DataSimulator.cpp \
        TableModel.cpp \
        main.cpp

RESOURCES += qml.qrc

HEADERS += \
    DataSimulator.h \
    TableModel.h
