<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jstl/core" prefix = "c"%>
<html>
<head>
    <title>Accounts.</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    <script>
        $(document).ready(function() {

            $('.close').click(function(){
                $('.close').remove();
                $("#error").remove();
            });

        });
    </script>
</head>
<body>
<div class="container">
    <ul class="nav nav-tabs">
        <li>
            <a href="/add_user" target="_parent">Users</a>
        </li>
        <li class="active"><a href="/account" target="_parent">Accounts</a></li>
        <li><a href="/transaction" target="_parent">Transactions</a></li>
    </ul>
    <h4>Accounts list:</h4>
    <table class="table table-hover" style="width: 300px;">
        <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>User</th>
            <th>Cash</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="account" items="${accountList}">
            <tr>
                <td><c:out value="${account.id }"></c:out></td>
                <td><c:out value="${account.name }"></c:out></td>
                <td><c:out value="${account.user.name }"></c:out></td>
                <td><c:out value="${account.cash }"></c:out></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <form action="/account" method="post">
        <h4>Add new account:</h4>
        Account name:</br>
        <input type="text" name="account_name" placeholder="insert account name"/></br>
        Select user name:</br>
        <select name="user_id" size="1">
            <option value="first" selected="selected">users</option>
            <c:forEach var="user" items="${usersList}">
                <option value="<c:out value="${user.id}"></c:out>"><c:out value="${user.name}"></c:out></option>
            </c:forEach>
        </select>
        </br>
        Cash:</br>
        <input type="text" placeholder="insert value of cash..." name="cash">
        </br>
        <button type="submit" class="btn btn-success">Add</button>
    </form>
</div>
</body>
</html>