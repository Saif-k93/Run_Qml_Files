#include "filedialog.h"

FileDialog::FileDialog(QWidget *parent)
    : QWidget{parent}
{
}

QString FileDialog::open_file()
{
    QString fileName;
    fileName.append(QFileDialog::getOpenFileName(this,
                                                 tr("Choose QML File"), "/home/Main.qml", tr("QML Files (*.qml)")));

    return fileName;
}
