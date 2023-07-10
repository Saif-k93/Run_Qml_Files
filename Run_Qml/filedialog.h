#ifndef FILEDIALOG_H
#define FILEDIALOG_H

#include <QWidget>
#include <QFileDialog>


class FileDialog : public QWidget
{
    Q_OBJECT
public:
    explicit FileDialog(QWidget *parent = nullptr);

    QString open_file();


signals:

};

#endif // FILEDIALOG_H
