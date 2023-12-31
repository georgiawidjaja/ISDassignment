<%-- 
    Document   : edit
    Created on : 28 Mar 2023, 12:20:35 pm
    Author     : Jack
--%>
<%@page import="IOTB.model.beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Edit</title>
    </head>
    <body>
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
            Admin admin = (Admin) session.getAttribute("admin");

            String userNameErr = (String) session.getAttribute("userNameErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String firstNameErr = (String) session.getAttribute("firstNameErr");
            String lastNameErr = (String) session.getAttribute("lastNameErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
            String DOBErr = (String) session.getAttribute("DOBErr");
            String phoneNumErr = (String) session.getAttribute("phoneNumErr");
            String streetErr = (String) session.getAttribute("streetErr");
            String suburbErr = (String) session.getAttribute("suburbErr");
            String stateErr = (String) session.getAttribute("stateErr");
            String postCodeErr = (String) session.getAttribute("postCodeErr");
            //Staff updated = request.getParameter("Updated");
        %>


        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">

            <% if (session.getAttribute("staff") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
            <% } %>

            <% if (session.getAttribute("admin") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
            <% } %> 

            <%if (session.getAttribute("staff") == null && session.getAttribute("admin") == null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a class="active" href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
        <div class="contentcontainer">
            <br>


            <h1 id="underlineandcenter">Edit your current details</h1>

            <!-- Placeholder buttons -->
            <% if (session.getAttribute("admin") == null) { %>
            <div id = "accessTabs">

                <form action = "AccessLogController" method = "post">
                    <input type = "submit" value = "Access Logs">
                </form>
                <span>   |   </span>
                <form action="PaymentDetails.jsp" method="post" target="_self">
                    <input type="submit" value="Add a card">
                </form>
                <span>   |   </span>
                <form action="UpdatePayment.jsp" method="post" target="_self">
                    <input type="submit" value="View all cards">
                </form>
            </div>
            <% } %>
            <% if (staff != null || customer != null) {%>
            <form action="editAccount" method = "POST">  
                <table>
                    <tr>
                        <td><label for = "email">Email:</label></td>

                        <td><input type = "email" id = "email" name = "email" value="${(customer!=null ? customer.email : staff.staffEmail)}"><h8> <%=(emailErr != null ? emailErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "userName">User Name: </label></td>
                        <td><input id = "userName" type = "text" name = "userName" value="${(customer!=null ? customer.userName : staff.staffUsername)}"><h8> <%=(userNameErr != null ? userNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "firstName">First Name: </label></td>
                        <td><input id = "firstName" type = "text" name = "firstName" value="${(customer!=null ? customer.firstName : staff.staffFirstName)}"><h8> <%=(firstNameErr != null ? firstNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "lastName">Last Name: </label></td>
                        <td><input type = "text" id = "lastName" name ="lastName" value="${(customer!=null ? customer.lastName : staff.staffLastName)}"><h8> <%=(lastNameErr != null ? lastNameErr : "")%> </h8></td>
                    </tr>

                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" value="${(customer!=null ? customer.password : staff.staffPassword)}"><h8> <%=(passwordErr != null ? passwordErr : "")%> </h8></td>
                    </tr>

                    <% if (staff == null) {%>
                    <tr>
                        <td><label for="DOB">Date Of Birth </label></td>
                        <td><input type = "date"  onfocus="this.showPicker()" id = "DOB" name ="DOB" value="${(customer!=null ? customer.DOB : "")}"><h8> <%=(DOBErr != null ? DOBErr : "")%> </h8></td>
                    </tr>
                    <% } else { %>
                    <tr>
                        <td><label for="position"> Your Position </label></td>
                        <td><input type = "text" id = "position" name ="position" value="${(staff!=null ? staff.staffPosition : "")}"></td>
                    </tr>
                    <tr>
                        <td><label for="ID"> Your staff ID </label></td>
                        <td><h3>${(staff!=null ? staff.staffID : "")}</h3></td>
                    </tr>
                    <% } %> 

                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">

                        </td>
                    </tr>
                </table>

                <% } %>
                <!<!-- this whole thing will have to be wrapped in an IF -->
                <% if (staff == null && customer != null) {%>
                <h1 id="underlineandcenter"> Shipping Details </h1>

                <table>
                    <tr>
                        <td><label for = "phonenum">Contact Number: </label></td>
                        <td><input type = "text" id = "phonenum" name = "phonenum" placeholder ="You need to add your phone number" value = "${(customer.phoneNum != "" ? customer.phoneNum : null)}"><h8> <%=(phoneNumErr != null ? phoneNumErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "street"> Street Number and Name: </label></td>
                        <td><input type = "text" id = "street" name = "street" placeholder ="You need to add your street" value = "${(customer.street != "" ? customer.street : null)}"><h8> <%=(streetErr != null ? streetErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "suburb"> Suburb: </label></td>
                        <td><input type = "text" id = "suburb" name = "suburb" placeholder ="You need to add your suburb" value = "${(customer.suburb != "" ? customer.suburb : null)}"><h8> <%=(suburbErr != null ? suburbErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "state"> STATE: </label></td>
                        <td><input type = "text" id = "state" name = "state" placeholder ="You need to add your state"  value = "${(customer.state != "" ? customer.state : null)}"><h8> <%=(stateErr != null ? stateErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "postCode"> Post Code: </label></td>
                        <td><input type = "text" id = "postCode" name = "postCode" placeholder ="You need to add a post code"  value = "${(customer.postCode != "" ? customer.postCode : null)}"> <%=(postCodeErr != null ? postCodeErr : "")%> </td>
                    </tr>
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">

                        </td>
                    </tr>


                </table>

                <a href='un-Register.jsp'>I want to delete my account.</a>

                <% } %> 
            </form>
            <% if (admin != null) {%>
            <form action="editAccount" method = "POST"> 

                <table>
                    <tr>
                        <td><label for = "Ademail">Email:</label></td>

                        <td><input type = "email" id = "Ademail" name = "Ademail" value="${admin.adminEmail}"><h8> <%=(emailErr != null ? emailErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "Adpassword">Password: </label></td>
                        <td><input id = "password" type = "Adpassword" name = "Adpassword" value="${admin.adminPassword}"><h8> <%=(passwordErr != null ? passwordErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for="ID"> Your Admin ID </label></td>
                        <td><h3>${admin.adminID}</h3></td>
                    </tr>
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">

                        </td>
                    </tr>

                </table>  
            </form>
            <% }%>

        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
