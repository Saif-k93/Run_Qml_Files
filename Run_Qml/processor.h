#ifndef PROCESSOR_H
#define PROCESSOR_H

#include <QObject>
#include <QProcess>
#include <QString>
#include <QDebug>
#include <string>
#include "filedialog.h"


class Processor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString run READ run NOTIFY runChanged)

public:
    explicit Processor(QObject *parent = nullptr);

    QString run();

    Q_INVOKABLE void open();
    Q_INVOKABLE void start();

signals:
    QString runChanged();
public slots:

private:
    FileDialog file;
    QString m_path;
};

#endif // PROCESSOR_H
