#pragma once

#include <QObject>
#include <QTimer>
#include "TableModel.h"

class DataSimulator : public QObject {
    Q_OBJECT

public:
    DataSimulator(TableModel* model, QObject* parent = nullptr);
    ~DataSimulator();

private slots:
    void generateRandomData();

private:
    int rowCount;
    TableModel* m_model;
    QTimer m_timer;
    std::vector<MyData>* newData;
};
