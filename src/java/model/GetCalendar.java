
package model;

import java.text.*;
import java.util.*;

public class GetCalendar {

    public String getDate() {
        Calendar c = Calendar.getInstance();
        SimpleDateFormat MMM_DD_YYYY_HH_MM_SS = new SimpleDateFormat("ddMMMyyyy_hhmmss");
        return MMM_DD_YYYY_HH_MM_SS.format(c.getTime());
    }

    public String getDateTime() {
        Calendar c = Calendar.getInstance();
        SimpleDateFormat MMM_DD_YYYY_HH_MM_SS = new SimpleDateFormat("MMM dd yyyy hh:mm:ss a");
        return MMM_DD_YYYY_HH_MM_SS.format(c.getTime());
    }
}