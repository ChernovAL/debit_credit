<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jstl/core" prefix = "c"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css"/>
        <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
        <script>
            $(document).ready(function() {
                $(function() {
                    $("ul#tabs").tabs("div#tab-content > div");
                    $('.close').click(function(){
                        $('.close').remove();
                        $("#error").remove();
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="container">
            <ul class="nav nav-tabs" id="tabs">
                <li><a href="#user">Users</a></li>
                <li><a href="#account">Accounts</a></li>
                <li><a href="#transaction">Transactions</a></li>
            </ul>

            <div class="tab-content" id="tab-content">
                <div class="tab-pane active" id="user">
                    <h4>Users list.</h4>
                    <table class="table table-hover">
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
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div id="errors">
                        <c:forEach var="error" items="${errorsList}">
                            <div class="alert alert-error" id="error">
                                <button class="close" type="button">x</button>
                                <c:out value="${error}"></c:out>
                            </div>
                        </c:forEach>
                    </div>

                    <form method="post" action="/add_user">
                        <h4>Add user</h4>
                        <fieldset>
                            <label>User name:</label>
                            <input type="text" class="input-large" placeholder="insert name" name="user_name"></br>
                            User type:
                            <input type="radio" name="user_type" value="client" checked="checked"> client
                            <input type="radio" name="user_type" value="system"> system</br>
                            <button type="submit" class="btn">Add</button>
                        </fieldset>
                    </form>
                </div>
                <div class="tab-pane" id="account">coming soon</div>
                <div class="tab-pane" id="transaction">coming soon!</div>
            </div>
        </div>
    </body>
</html>