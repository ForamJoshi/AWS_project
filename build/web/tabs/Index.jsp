<html>
    <head>
        <title> AWS DATABASE </title>
        <link type="text/css" href="./js/ui.all.css" rel="stylesheet" />
        <script type="text/javascript" src="./js/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="./js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="./js/ui.core.js"></script>
        <script type="text/javascript" src="./js/ui.tabs.js"></script>

        <script type="text/javascript" src="./js/ui.datepicker.js"></script>
        <link type="text/css" href="./js/demos.css" rel="stylesheet" />
        <link type="text/css" href="./js/style.css" rel="stylesheet" />

        <script type="text/javascript">
            
            $(function() {
                $("#tabs").tabs({
                    collapsible: false
                });
            });
        </script>
    </head>

    <body >
        <table border="0">
            <tr>	
            <td><input type="image" src="./Images/Picture7.png"/></td>
        </tr>
    </table>

    <table width="100%">
        <tr>
        <td>
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Home</a></li>
                    <li><a href="#tabs-2">Admin</a></li>
                    <li><a href="#tabs-3">About Us</a></li>
                </ul>

                <div id="tabs-1">

                    <jsp:include page="Guest/Guest.jsp"/>

                </div>
                <div id="tabs-2">

                    <jsp:include page="Admin/AdminLogin.jsp"/>

                </div>
                <div id="tabs-3">
                    <table height="385px" align="center" style="color: blue;" cellpadding="5">
                        <tr>
                        <td align="center">
                            <img src="./Images/isro.png"/> 
                        </td>
                        </tr>
                        <tr>
                        <td align="center">
                            <h3>Welcome to IMD-AWS Database Storage.</h3> 
                        </td>
                        </tr>
                        <tr>
                        <td></td>
                        </tr>
                        <tr>
                        <td></td>
                        </tr>
                        <tr>
                        <td>
                            It is web-based software that gets IMD-AWS Data From the Original Website http://www.imdaws.com and store into our Database
                        </td>
                        </tr>
                        <tr>
                        <td>
                            with various parameter like Rainfall, Minimum Temp., Dew Point etc. Here Data available From all IMD-AWS Stations across India daily 
                        </td>
                        </tr>
                        <tr>
                        <td>
                            base so you can download daily Data from 2012 onwards.
                        </td>
                        </tr>
                        <tr>
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            Users are requested to send technical problems/suggestions to <b>Shashikant A. Sharma</b> on 4335 or sasharma@sac.isro.gov.in
                        </td>
                        </tr>
                        <tr>
                        <td></td>
                        </tr>
                        <tr>
                        <td></td>
                        </tr>
                        <tr>
                        <td></td>
                        </tr>
                    </table>


                </div>
            </div>
        </td>
    </tr>
    <tr>
    <td>
        <center>
            <font style="color: #1b75bb; font-family: Verdana, Arial, Helvetica, sans-serif;">Best Viewed with 1024 x 768 Resolution | Supports Browsers Mozilla Firefox 9.0, Google Chrome 4.0 onwards.
        </center>
    </td>
    </tr>
</table>
</body>
</html>