#include "processor.h"

Processor::Processor(QObject *parent)
    : QObject{parent}
{
}

QString Processor::run()
{
    return m_path;
}

void Processor::open()
{
    m_path = file.open_file();

    if(m_path.length() > 0){
        int x = 0;
        for(x = 0;x < m_path.length();x++){
            if(m_path[x] == '.'){
                break;
            }
        }
        std::string p(m_path.toStdString());
        QString str = QString::fromStdString(p.substr(x,m_path.length()));

        if(str == ".qml") emit runChanged();
        else{
            m_path = "Erorr: Not Qml File";
            emit runChanged();
        }
    }
}

void Processor::start()
{
    QProcess process;
    process.setProgram("qml.exe");
    process.setArguments({ "/C", m_path });
    process.startDetached();

    process.waitForFinished(15000);

}


