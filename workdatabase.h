#ifndef WORKDATABASE_H
#define WORKDATABASE_H

#include <QObject>
#include <QSqlTableModel>
#include <QStandardItemModel>
#include "mysqltablemodel.h"
#include <QtSql/QSqlDatabase>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QtQml>



#include "webelement.h"

class WorkDatabase : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList list_ElementTableModel READ getlist_ElementTableModel NOTIFY list_ElementTableModelChanged)
    Q_PROPERTY(QStringList list_ProjectTableModel READ getlist_ProjectTableModel NOTIFY list_ProjectTableModelChanged)

    Q_PROPERTY(MySQLTableModel *TableModel READ getTableModel WRITE setTableModel NOTIFY TableModelChanged)
    //Q_PROPERTY(QStringList list_Roles READ getlist_Roles)

    Q_PROPERTY(uint total READ getTotal)



    Q_PROPERTY(MySQLTableModel *SelectElementTableModel READ getSelectElementTableModel NOTIFY SelectElementTableModelChanged)

    Q_PROPERTY(WebElement *myWebElement READ getWebElement WRITE setWebElement NOTIFY WebElementChanged)

    QSqlDatabase base;
    QSqlQuery *query;


    MySQLTableModel *TableModel;
    MySQLTableModel *SelectElementTableModel;

    //QStringList list_Roles;
    QStringList list_ElementTableModel;
    QStringList list_ProjectTableModel;

    uint total = 0;

    WebElement *myWebElement;

public:
    explicit WorkDatabase(QObject *parent = nullptr);
    ~WorkDatabase();


    MySQLTableModel *getTableModel();
    void setTableModel(MySQLTableModel *model);

    //bool getisElemnt();
    //QStringList getlist_Roles();

    uint getTotal();

    QStringList getlist_ElementTableModel();
    QStringList getlist_ProjectTableModel();

    MySQLTableModel *getSelectElementTableModel();

    WebElement* getWebElement();
    void setWebElement(WebElement *p);

    Q_INVOKABLE void createTable(QString str);
    Q_INVOKABLE void createProject(QString str);
    Q_INVOKABLE void deleteTableOrProject(QModelIndex index);
    Q_INVOKABLE void updateTableModel(QString name);
    //Q_INVOKABLE void updateListRoles(QModelIndex index);

    /*Q_INVOKABLE*/ QStringList getDataFromModel(uint row);

    /*Q_INVOKABLE*/ bool addElement(QStringList list);
    /*Q_INVOKABLE*/ bool editElement(QStringList newList);

    /*Q_INVOKABLE*/ bool addProjectElement(QStringList list);
    /*Q_INVOKABLE*/ bool editProjectElement(QStringList newList);

    /*Q_INVOKABLE*/ bool removeElement(uint row);


     /*Q_INVOKABLE*/ void chekUpdateTime();
     /*Q_INVOKABLE*/ void updatePriceAndAvailability();

    /*Q_INVOKABLE*/ void updateSelectedTableElementModel(int row);
    /*Q_INVOKABLE*/ QString getName_SelectedTableElementModel(int row);
    /*Q_INVOKABLE*/ uint getCount_SelectedTableElementModel(int row);
    /*Q_INVOKABLE*/ uint getPrice_SelectedTableElementModel(int row);
    /*Q_INVOKABLE*/ uint getAvailability_SelectedTableElementModel(int row);

    /*Q_INVOKABLE*/ void calculatePriceProject();
    /*Q_INVOKABLE*/ void activateProject();

    /*Q_INVOKABLE*/ void saveDtBs(QString path);


signals:
     void list_TableModelChanged();
     void TableModelChanged();
     void list_RolesChanged();
     void list_ElementTableModelChanged();
     void list_ProjectTableModelChanged();
     void SelectElementTableModelChanged();
     void WebElementChanged();

     void startUpdate();
     void finishUpdate();
     void errorUpdate(QString str);
     void timeUpdate();


public slots:




};

#endif // WORKDATABASE_H
