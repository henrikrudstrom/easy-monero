TEMPLATE = app

QT += qml quick
CONFIG += c++11

RESOURCES += qml.qrc

HEADERS += \
    oscursor.h


SOURCES += main.cpp \
    oscursor.cpp

lupdate_only {
SOURCES = *.qml \
        Window/*.qml \
        Elements/*.qml
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include(qml-material/qml-material.pri)
