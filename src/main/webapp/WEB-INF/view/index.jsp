<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<body>
    <h2>Hello Guys!</h2>
    <br/>

    <p>
        User: <security:authentication property="principal.username" />
        <br><br>
        Role(s): <security:authentication property="principal.authorities" />
    </p>

    <br/>

<!--
    <hr/>

    <p>
        <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting(Only for Managers)</a>
    </p>

    <hr/>

    <p>
        <a href="${pageContext.request.contextPath}/systems">Leadership Meeting(Only for Admins)</a>
    </p>

    <hr/>
-->

    <security:authorize access="hasRole('MANAGER')">
        <hr/>

        <p>
            <a href="${pageContext.request.contextPath}/leaders">Leadership Meeting(Only for Managers)</a>
        </p>

        <hr/>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
        <hr/>

        <p>
            <a href="${pageContext.request.contextPath}/systems">Leadership Meeting(Only for Admins)</a>
        </p>

        <hr/>
    </security:authorize>

    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
        <input type="submit" value="logout" />
    </form:form>
</body>
</html>
