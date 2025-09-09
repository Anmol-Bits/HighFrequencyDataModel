#include "TableModel.h"

TableModel::TableModel(QObject* parent):
    QAbstractTableModel(parent),
    m_data(nullptr) {}

int TableModel::rowCount(const QModelIndex& /*parent*/) const {
    return static_cast<int>(m_data->size());
}

int TableModel::columnCount(const QModelIndex& /*parent*/) const {
    return 1;
}

QVariant TableModel::data(const QModelIndex& index, int role) const {
    if (!index.isValid())
        return QVariant();

    if(!m_data) return QVariant();

    const MyData& item = m_data->at(index.row());

    switch (role) {
        case IdRole: return item.id;
        case NameRole: return item.name;
        case ValueRole: return item.value;
        default: return QVariant();
    }
}

QHash<int, QByteArray> TableModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[ValueRole] = "value";
    return roles;
}

void TableModel::init(std::vector<MyData> *data) {
    m_data = data;
}

void TableModel::update() {
    beginResetModel();
    // qDebug() << __FUNCTION__;
    endResetModel();
}
