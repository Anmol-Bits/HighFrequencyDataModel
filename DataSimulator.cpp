#include "DataSimulator.h"
#include <QRandomGenerator>

DataSimulator::DataSimulator(TableModel* model, QObject* parent)
    : QObject(parent),
      m_model(model) {
    connect(&m_timer, &QTimer::timeout, this, &DataSimulator::generateRandomData);
    m_timer.start(1); // every 1 ms

    newData = new std::vector<MyData>();

    rowCount = 100'000;
    newData->reserve(rowCount);
    newData->resize(rowCount);
    m_model->init(newData);
}

DataSimulator::~DataSimulator() {
    delete newData;
}

void DataSimulator::generateRandomData() {
    for (int i = 0; i < rowCount; ++i) {
        MyData d;
        d.id = i + 1;
        d.name = QString("Sensor %1").arg(i + 1);
        d.value = QRandomGenerator::global()->bounded(100.0); // Random 0-100
        newData->at(i) = d;
    }

    m_model->update();
}
