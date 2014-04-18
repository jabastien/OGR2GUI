# ogr2gui 0.7

TEMPLATE = app
TARGET = ogr2gui
DEPENDPATH += $$PWD/src $$PWD/include $$PWD/include/mingw-builds_x86
INCLUDEPATH += $$PWD/src $$PWD/include $$PWD/include/mingw-builds_x86
LIBS += -L$$PWD/lib/mingw-builds_x86 -lgdal

HEADERS += \
    include/App.h \
    include/Dta.h \
    include/Ogr.h \
    include/Inf.h

SOURCES += \
    src/Ogr.cpp \
    src/Inf.cpp \
    src/App.cpp

CONFIG += c++11
#CONFIG += static
QT += sql widgets

QMAKE_CXXFLAGS+= -std=c++11
QMAKE_LFLAGS += -std=c++11

static {
    CONFIG += static
    DEFINES += STATIC
    message("~~~ static build ~~~") # this is for information, that the static build is done
    win32: TARGET = $$join(TARGET,,,mingw-buildss) #this adds an s in the end, so you can seperate static build from non static build
}

CONFIG(debug, debug|release) {
     win32: TARGET = $$join(TARGET,,,mingw-buildsd)
}
