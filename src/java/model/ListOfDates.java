package model;

import java.text.*;
import java.util.*;
import org.joda.time.DateTime;

public class ListOfDates {

    private int category;
    private String year;
    ArrayList<String> listOfDates;

    public String getConCatListDates(String fromDate, String toDate, int category, String year) throws ParseException {
        String selectString = "";
       
        String splitFromDate[] = fromDate.split("/");
        String splitToDate[] = toDate.split("/");
        this.year = year;
        this.category = category;

        SimpleDateFormat YYYY_MM_DD = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat DD_MMM_YY = new SimpleDateFormat("dd-MMM-yy");

        DateTime start = DateTime.parse(splitFromDate[2] + "-" + splitFromDate[1] + "-" + splitFromDate[0]);
        DateTime end = DateTime.parse(splitToDate[2] + "-" + splitToDate[1] + "-" + splitToDate[0]);
        
        listOfDates = new ArrayList();
        while (start.equals(end) || start.isBefore(end)) {
            listOfDates.add(DD_MMM_YY.format(YYYY_MM_DD.parse(start.toLocalDate().toString())));
            start = start.plusDays(1);
        }

        for (int x = 0; x < listOfDates.size(); x++) {
            selectString = selectString + "," + removeHyphen(listOfDates.get(x));
          
        }
        return selectString.substring(1);
    }

    public ArrayList getListOfDates() {
        return listOfDates;
    }

    public String removeHyphen(String date) {
        String tableName = "";
        if (category == 0) {
            tableName = "\"MinTemp_" + year + "\"";
        }
        if (category == 1) {
            tableName = "\"MaxTemp_" + year + "\"";
        }
        if (category == 2) {
            tableName = "\"Rainfall_" + year + "\"";
        }
        if (category == 3) {
            tableName = "\"DEWPoint_" + year + "\"";
        }
        if (category == 4) {
            tableName = "\"SunShine_" + year + "\"";
        }
        if (category == 5) {
            tableName = "\"WindSpeed_" + year + "\"";
        }
        return tableName + ".\"D" + date.substring(0, 2) + date.substring(3, 6) + date.substring(7, 9) + "\"";
    }
    
    
}
