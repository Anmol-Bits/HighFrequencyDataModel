#pragma once

#include <QAbstractTableModel>
#include <QString>
#include <vector>

struct MyData {
    int id;
    double value;
    QString name;
};

class TableModel : public QAbstractTableModel {
    Q_OBJECT

public:
    enum MyRoles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        ValueRole
    };

    explicit TableModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    int columnCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;
    void init(std::vector<MyData>* data);
    void update();

private:
    std::vector<MyData>* m_data;
};
