<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Login Form</title>
    </head>
    <body>
        <h2>My Custom Login Page</h2>
        <form:form action="${pageContext.request.contextPath}/authenticateTheUser"
                    method="POST">

            <c:if test="${param.error !=null}">
                <i>Wrong username or password entered!</i>
            </c:if>

            <p>User name: <input type ="text" name="username" /></p>
            <p>Password: <input type ="password" name="password" /></p>
            <input type="submit" value="Login" />
        </form:form>
    </body>
</html>