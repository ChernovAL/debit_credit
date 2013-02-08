<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
<head>
    <title>Transactions.</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css"/>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
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
            </div>
            <div class="span10">

                <ul class="nav nav-tabs">
                    <li>
                        <a href="/add_user" target="_parent">Users</a>
                    </li>
                    <li><a href="/account" target="_parent">Accounts</a></li>
                    <li class="active"><a href="/transaction" target="_parent">Transactions</a></li>
                </ul>

                <table class="table table-hover" style="width: 300px;">
                    <h4>Transactions list:</h4>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Debit account</th>
                        <th>Credit account</th>
                        <th>Sum</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="trans" items="${transList}">
                        <tr>
                            <td><c:out value="${trans.id}"></c:out></td>
                            <td><c:out value="${trans.debitAccount.name}"></c:out></td>
                            <td><c:out value="${trans.creditAccount.name}"></c:out></td>
                            <td><c:out value="${trans.sum}"></c:out></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <form method="post" action="/transaction">
                    <h4>Add new transaction:</h4>
                    Debit account:</br>
                    <select name="debit_id" size="1">
                        <option value="0" selected="selected">accounts</option>
                        <c:forEach var="account" items="${accountList}">
                            <option value="<c:out value="${account.id}"></c:out>"><c:out value="${account.name}"></c:out></option>
                        </c:forEach>
                    </select>
                    </br>
                    <%----%>
                    Credit account:</br>
                    <select name="credit_id" size="1">
                        <option value="0" selected="selected">accounts</option>
                        <c:forEach var="account" items="${accountList}">
                            <option value="<c:out value="${account.id}"></c:out>"><c:out value="${account.name}"></c:out></option>
                        </c:forEach>
                    </select>
                    </br>
                    Sum value:</br>
                    <input type="text" name="sum_value" placeholder="Insert value of sum..."/>
                    </br>
                    <button type="submit" class="btn btn-success">Add</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>