
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
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
        <script type="text/javascript">
            $(document).ready(function(){
                $("#login_frm").submit(function(){

                    //remove previous class and add new "myinfo" class
                    $("#msgbox").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);

			
                    this.timer = setTimeout(function () {
                        $.ajax({
                            url: 'Admin/AdminLoginCheck.jsp',
                            data: 'un='+ $('#login_id').val() +'&pw=' + $('#password').val(),
                            type: 'post',
                            success: function(msg){
                                if(msg != 'ERROR') // Message Sent, check and redirect
                                {				// and direct to the success page
							
                                    $("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,
                                    function()
                                    {
                                        //redirect to secure page
                                        document.location='Admin/Admin.jsp';
                                    });
	
                                }
                                else
                                {
                                    $("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
                                    {
                                        //add message and change the class of the box and start fading
                                        $(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);
                                    });
	
                                }
                            }
				
                        });
                    }, 200);
                    return false;
                });		

            });
        </script>  

        <link href="./js/style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login Form</title>
    </head>
    <body>
        <table border="0">
            <tr>	
            <td><input type="image" src="./Images/Picture7.png"/></td>
        </tr>
    </table>
        <table width="100%">
        <tr>
            <td>
                <div id="tabs">
                    <ul><li><a href="#tabs-3">Download</a></li>
                </ul>
                <div id="tabs-3">
        <table border="0 " style="background-color: rgb(255, 255, 255); border-color: rgb(100, 166, 210); border-style: solid; border-width: 1px; background-image: url(&quot;Images/table_bg.png&quot;); background-position: center top; background-repeat: repeat-x;" align="center" cellspacing="0" width="650px" height="385px">  
                <tbody>
                    
                    <tr valign="top">
                        <td>
                            <center><h3 style="font-size:18px;
                font-family: Verdana, Arial, Helvetica, sans-serif;
                color: royalblue; font-weight:bold">Admin Login ! </h3></center>
        <form name="login_frm" id="login_frm" action="" method="post">
                
                
                <div id="login_box">
                <div id="login_header">
                    
                </div>
                <div id="form_val">
                    <div class="label">User Id :</div>
                    <div class="control"><input type="text" name="login_id" id="login_id" autocomplete="off"/></div>

                    <div class="label">Password:</div>
                    <div class="control"><input type="password" name="password" id="password" autocomplete="off"/></div>
                    <div style="clear:both;height:0px;"></div>

                    <div id="msgbox"></div>
                </div>
                <div id="login_footer">
                    <label>
                        <input type="submit" name="login" id="login" value="Login" class="send_button" />
                    </label>
                </div>
            </div>
        </form>
                            </td>
                   </tr>  
                   <tr>
                       <td>
                <center>*Only Admin can login this page for Download Data From Website http://www.imdaws.com</center>
                       </td></tr>
               </tbody>
           </table>
                </div>
    </body>
</html>