TEMPLATE = app

QT += qml quick
CONFIG += c++11

RESOURCES += qml.qrc

HEADERS += \
    oscursor.h


SOURCES += main.cpp \
        oscursor.cpp \


lupdate_only {
SOURCES = *.qml \
        Window/*.qml \
        Elements/*.qml \
        Actions/*.qml \
        Stores/*.qml \
        Views/*.qml
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/vendor/lib/qml-material/modules #qml-material/modules


# Default rules for deployment.
include(deployment.pri)
include(vendor/lib/qml-material/qml-material.pri)
include(vendor/lib/quickflux/quickflux.pri)
include(vendor/lib/gel/com_cutehacks_gel.pri)
INCLUDEPATH += vendor/lib/gel/


DISTFILES += *.qml \
        Window/*.qml \
        Elements/*.qml \
    Icons.qml \
    SidebarItem.qml \
    MainSideBar.qml \
    ViewActions.qml \
    Actions/ViewActionTypes.qml \
    Stores/qmldir \
    Actions/qmldir \
    Views/TransactionView.qml \
    BaseView.qml

