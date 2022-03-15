<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <table class="table table-striped" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>员工姓名</th>
                        <th>员工邮箱</th>
                        <th>员工性别</th>
                        <th>员工部门</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">当前页 数，总共 页，总共记录 </div>
        <div class="col-md-6">

        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/emps",
                data:"pn=1",
                type:"GET",
                sucess:function (result) {
                    //console.log(result);
                    buile_emps_table(result);
                }
            });
        });
        function buile_emps_table(result) {
            var emps = result.extent.pageInfo.list;
            $.each(emps,function(index,item){
                var empIdtd = $("<td></td>").append(item.empId);
                var empNametd = $("<td></td>").append(item.empName);
                var emailtd = $("<td></td>").append(item.email);
                var gend = item.gender=="M"? "男":"女";
                var gendertd = $("<td></td>").append(gend);
                var depNametd = $("<td></td>").append(item.department.depName);
                $("<tr></tr>").append(empIdtd)
                    .append(empNametd).append(emailtd)
                    .append(gendertd).append(depNametd)
                    .appendTo("#emps_table tbody");
            });
        }
        function build_page_nav(result) {

        }
    </script>
</div>


</body>
</html>

