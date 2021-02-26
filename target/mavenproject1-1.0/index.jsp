<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String str = request.getParameter("t1");
    Class.forName("org.postgresql.Driver");
    String host = "ec2-23-23-241-119.compute-1.amazonaws.com";
    String db = "d3ubb9aqe47mmh?sslmode=require";
    String username = "bgmiccgyndwfsy";
    String password = "45449448f1db70473387eb5c2c60e68661372449f1dab875851b7c9a792b2eca";
    Connection con1 = DriverManager.getConnection("jdbc:postgresql://"+host+":5432/"+db,username,password);
    Statement st1 = con1.createStatement();
    if(str!= null){
        for(int i=0;i<str.length();i++){
        if(str.charAt(i)==39){
            int loc = i;
            char arr[] = new char[str.length()+1];
            for(i=0;i<=loc;i++){
                arr[i] = str.charAt(i);
            }
            for(i=str.length()-1;i>loc;i--){
                arr[i+1] = str.charAt(i);
            }
            arr[loc+1]=39;
            str = String.valueOf(arr);
            i = loc+1;
        }
    }
    st1.executeUpdate("update msg set info = '"+str+"'");}
    st1.close();con1.close(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
</head>
<body style="text-align: center; font-family: sans-serif; margin: 0;padding: 0; background-color: #5e4fd0; color:#fff;">
    <h1 style="font-weight: 50">Welcome!</h1>
    <textarea id="content" readonly placeholder="Your message will display here..." style="font-family: sans-serif; resize: none; width: 210px; height: 50px; padding: 5px;"></textarea><br>
    <form action="index.jsp">
        <input type="text" placeholder="Enter message here..." maxlength="100" name="t1" required autocomplete="off" style="padding: 5px; width: 140px;"> <input type="submit" value="Send" style="padding: 5px; width: 60px;">
    </form><br>
    <p style="font-size: 10px"><em>Please wait for reply before sending message to avoid message collision !</em></p>
    <script src="https://code.jquery.com/jquery-3.4.0.js" integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
            refresh();
        });
        function refresh(){
            setTimeout( function(){
                $('#content').load('display.jsp');
                refresh();
            },1000);
        }
    </script>
</body>
</html>