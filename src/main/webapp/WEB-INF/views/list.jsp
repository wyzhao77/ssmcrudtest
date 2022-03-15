<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/3/14
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <script src="https://fastly.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM_CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-8">
                <button class="btn btn-success" type="submit">新增</button>
                <button class="btn btn-danger" type="submit">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped">
                    <tr>
                        <th>#</th>
                        <th>员工姓名</th>
                        <th>员工邮箱</th>
                        <th>员工性别</th>
                        <th>员工部门id</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list }" var="emp">
                        <tr>
                            <th>${emp.empId }</th>
                            <th>${emp.empName }</th>
                            <th>${emp.email }</th>
                            <th>${emp.gender=="M"? "男":"女" }</th>
                            <th>${emp.department.depName }</th>
                            <th>
                                <button class="btn btn-success btn-sm" type="submit">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    新增</button>
                                <button class="btn btn-danger btn-sm" type="submit">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    删除</button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">当前页数${pageInfo.pageNum }数，总共${pageInfo.pages }页，总共记录${pageInfo.total }</div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/emps?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li>
                                <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums }" var="pageNumber">
                            <c:if test="${pageNumber == pageInfo.pageNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/emps?pn=${pageNumber }">${pageNumber }</a></li>
                            </c:if>
                            <c:if test="${pageNumber != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/emps?pn=${pageNumber }">${pageNumber }</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage }">
                            <li>
                                <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages }">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="row"></div>
    </div>


</body>
</html>
