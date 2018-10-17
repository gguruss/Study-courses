package ru.shemplo.tasks.db;

import java.util.ArrayList;
import java.util.List;

import java.sql.ResultSet;
import java.sql.SQLException;

import ru.shemplo.snowball.utils.db.DBType;
import ru.shemplo.tasks.mvc.model.ListOfTasks;

public class DBAccess {

    private DBConnection db;
    
    private final String SQL_GET_ALL_LISTS
        = "SELECT * FROM `lists`";
    
    public DBAccess () {
        this.db = DBConnection.getInstanceOf (DBType.MySQL);
    }
    
    public List <ListOfTasks> getAllLists () {
        try {
            ResultSet result = db.execute (SQL_GET_ALL_LISTS);
            List <ListOfTasks> lists = new ArrayList <> ();
            
            while (result.next ()) {
                lists.add (ListOfTasks.valueFrom (result));
            }
            
            return lists;
        } catch (SQLException sqle) {}
        
        return new ArrayList <> ();
    }
    
}
