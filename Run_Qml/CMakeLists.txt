cmake_minimum_required(VERSION 3.16)

project(Run_Qml VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Widgets)

qt_add_executable(appRun_Qml
    main.cpp
    processor.h
    processor.cpp
    filedialog.h
    filedialog.cpp
    res.qrc

)

qt_add_qml_module(appRun_Qml
    URI Run_Qml
    VERSION 1.0
    QML_FILES
    Main.qml
    MainView.qml

)



set_target_properties(appRun_Qml PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRun_Qml
    PRIVATE Qt6::Quick
    Qt6::Widgets
)

install(TARGETS appRun_Qml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
