<%--
  Created by IntelliJ IDEA.
  User: Hien
  Date: 4/22/2024
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerListURL" value="/admin/customer-list" />
<c:url var="customerAPI" value="/admin/customer" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success" role="alert">
            ${successMessage}
    </div>
</c:if>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Danh sách khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Danh sách khách hàng
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box ui-sortable-handle show" style="opacity: 1;">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-down"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <%--@elvariable id="modelSearch" type=""--%>
                                <form:form modelAttribute="modelSearch" action="${customerListURL}" method="get" id="listForm">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-4">
                                                    <label class="name">Tên khách hàng</label>
                                                    <form:input class="form-control" path="fullName"/>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label class="name">Di động</label>
                                                    <form:input class="form-control" path="phone"/>
                                                </div>
                                                <div class="col-sm-4">
                                                    <label class="name">Email</label>
                                                    <form:input class="form-control" path="email"/>
                                                </div>
                                            </div>
                                        </div>
                                        <security:authorize access="hasAnyRole('MANAGER','ADMIN')">
                                            <div class="form-group">
                                                <div class="col-xs-12">

                                                        <div class="col-sm-2">
                                                            <label class="name">Nhân viên phụ trách</label>
                                                            <form:select class="form-control" path="staffId">
                                                                <form:option value="">--Chọn nhân viên--</form:option>
                                                                <form:options items="${listStaffs}"/>
                                                            </form:select>
                                                        </div>
                                                </div>
                                            </div>
                                        </security:authorize>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <button type="button" class="btn btn-danger" style="border: 0;" id="btnSearchCustomer">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                        </svg>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                        <div class="pull-right padding-1">
                            <a href="/admin/customer-edit">
                                <button class="btn btn-primary" title="Thêm khách hàng" style="border: 0;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                        <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                    </svg>
                                </button>
                            </a>
                            <button class="btn btn-danger" title="Xóa khách hàng" style="border: 0;" id="btnDeleteCustomer">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                    <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                </svg>
                            </button>
                        </div>
                    </security:authorize>
                </div>
                <div class="col-xs-12">
                    <display:table name="customerList.listResult" cellpadding="0" cellspacing="0"
                                   requestURI="${customerListURL}" partialList="true" sort="external"
                                   size="${customerList.totalItem}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${customerList.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5rem;font-family: 'Times New Roman';font-size: smaller">
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column title="Tên khách hàng" property="fullName"/>
                        <display:column title="Số điện thoại" property="phone" />
                        <display:column title="Email" property="email" />
                        <display:column title="Nhu cầu" property="demand" />
                        <display:column title="Người thêm" property="createdBy" />
                        <display:column title="Ngày thêm" property="createdDate" />
                        <display:column title="Trạng thái" property="status" />
                        <display:column title="Thao tác">
                            <div class="hidden-sm hidden-xs btn-group">
                                <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                    <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})">
                                        <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                    </button>
                                </security:authorize>

                                <a class="btn btn-xs btn-info" title="Sửa khách hàng" href="/admin/customer-edit-${tableList.id}">
                                    <security:authorize access="hasRole('STAFF')">
                                        <i class="ace-icon fa fa-eye bigger-120"></i>
                                    </security:authorize>
                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </security:authorize>
                                </a>
                                <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                    <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>
                                </security:authorize>
                            </div>
                        </display:column>
                    </display:table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body" style="text-align: center;">
                <table class="table table-striped table-bordered table-hover" cellspacing="0" cellpadding="0" id="staffList">
                    <thead>
                    <tr >
                        <th class="center">Chọn</th>
                        <th class="center">Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    $('#btnSearchCustomer').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    })

    function assignmentCustomer(customerId){
        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $("#customerId").val(customerId);
        $('#btnAssignmentCustomer').click(function(e){
            e.preventDefault();
            var data = {};
            data['customerId'] = $('#customerId').val();
            var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data["staffs"] = staffs;
            assignment(data);
        });
    }

    function assignment(data){
        $.ajax({
            type: "Post",
            url: "${customerAPI}/assignment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond){
                console.log("Success");
                window.location.href = "<c:url value="/admin/customer-list"/>"
            },
            error: function (respond){
                console.log("Failed");
                console.log(respond);
            }
        });
    }

    function loadStaff(customerId){
        $.ajax({
            type: "Get",
            url: "${customerAPI}/" + customerId + "/staffs",
            contentType: "application/json",
            dataType: "JSON",
            success: function (response){
                var row = "";
                $.each(response.data,function (index,item){
                    row += "<tr>";
                    row += '<td class="center"><input type="checkbox" id="checkbox_' + item.staffId + '" value=' + item.staffId + " " + item.checked + '/>' + "</td>";
                    row += '<td>' + item.fullName + '</td>';
                    row += "</tr>";
                });
                $("#staffList tbody").html(row);
                console.log("Success");
            },
            error: function (response){
                console.log("Failed");
                console.log(response);
            }
        });
    }

    function deleteCustomer(customerId){
        var customerId = [customerId];
        showAlertBeforeDelete(function() {
            deleteCustomers(customerId);
        });
    }

    $("#btnDeleteCustomer").click(function (e){
        e.preventDefault();
        var customerIds = $("#tableList").find("tbody input[type = checkbox]:checked").map(function (){
            return $(this).val();
        }).get();
        showAlertBeforeDelete(function() {
            deleteCustomers(customerIds);
        });
    });

    function deleteCustomers(data){
        $.ajax({
            type: "Delete",
            url: "${customerAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (respond){
                console.log("Success");
                window.location.href = "<c:url value="/admin/customer-list"/>"
            },
            error: function (respond){
                console.log("Failed");
                console.log(respond);
            }
        });
    }
</script>
</body>
</html>
