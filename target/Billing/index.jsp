<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jstl/core" prefix = "c"%>
<html>
<head>
    <title>Users.</title>
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
        <li class="active">
            <a href="/add_user" target="_parent">Users</a>
        </li>
        <li><a href="/account" target="_parent">Accounts</a></li>
        <li><a href="/transaction" target="_parent">Transactions</a></li>
    </ul>
    <h4>Users list:</h4>
    <table class="table table-hover" style="width: 300px;">
        <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Type</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${usersList}">
            <tr>
                <td><c:out value="${user.id }"></c:out></td>
                <td><c:out value="${user.name}"></c:out></td>
                <td><c:out value="${user.type}"></c:out></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div id="errors">
        <c:forEach var="error" items="${errorsList}">
            <div class="alert alert-error" style="width: 200px;" id="error">
                <button class="close" type="button">x</button>
                <c:out value="${error}"></c:out>
            </div>
        </c:forEach>
    </div>

    <form method="post" action="/add_user">
        <h4>Add new user:</h4>
        <fieldset>
            <label>User name:</label>
            <input type="text" class="input-large" placeholder="insert name" name="user_name"></br>
            User type:
            <input type="radio" name="user_type" value="client" checked="checked"> client
            <input type="radio" name="user_type" value="system"> system</br>
            <button type="submit" class="btn btn-success">Add</button>
        </fieldset>
    </form>
</div>
</body>
</html>