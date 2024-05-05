<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Hien
  Date: 4/24/2024
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/admin/customer"/>
<c:url var="transactionAPI" value="/admin/transaction"/>
<html>
<head>
    <c:if test="${not empty customerEdit.id}">
        <title>Sửa khách hàng</title>
    </c:if>
    <c:if test="${empty customerEdit.id}">
        <title>Thêm khách hàng</title>
    </c:if>
</head>
<body>
<div class="main-content">
    <div id="alertContainer" style="position: fixed; top: 20px; right: 20px; z-index: 9999;"></div>
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
                <li class="active">Quản lý khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>
    </div>

    <div class="page-content">

        <div class="page-header">
            <h1>
                <c:if test="${not empty customerEdit.id}">
                    Sửa khách hàng
                </c:if>
                <c:if test="${empty customerEdit.id}">
                    Thêm khách hàng
                </c:if>
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    overview &amp; stats
                </small>
            </h1>
        </div><!-- /.page-header -->

        <form:form modelAttribute="customerEdit" id="listForm" method="get">
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-xs-3">Tên khách hàng</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="fullName" name="fullName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3">Số điện thoại</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="phone" name="phone"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Email</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="email" name="email"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tên công ty</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="companyName" name="companyName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Nhu cầu</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="demand" name="demand"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tình trạng</label>
                            <div class="col-xs-4">
                                <form:select class="form-control" path="status" name="status">
                                    <form:option value="">--Chọn tình trạng--</form:option>
                                    <form:options items="${statusType}"></form:options>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty customerEdit.id}" >
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                    <button type="button" class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                                <c:if test="${empty customerEdit.id}" >
                                    <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm mới</button>
                                    <button type="button" class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                            </div>
                        </div>

                        <form:hidden path="id" id="customerId"/>
                    </div>
                </div>
            </div>
        </form:form>
        <c:forEach var="item" items="${transactionType}">
            <div class="col-xs-12">
                <div class="col-sm-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                    <button class="btn btn-sm btn-primary" onclick="transactionType('${item.key}','${customerEdit.id}')">
                        <i class="ace-icon fa fa-plus align-items-center"></i>Add
                    </button>
                </div>
                <c:if test="${item.key == 'CSKH'}">
                    <div class="col-xs-12">
                        <display:table class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5rem;font-family: 'Times New Roman';font-size: smaller"
                                       id="tableList"
                                       name="CSKH">
                            <display:column title="Ngày tạo" property="createdDate"/>
                            <display:column title="Người tạo" property="createdBy"/>
                            <display:column title="Chi tiết giao dịch" property="note"/>
                            <display:column title="Thao tác">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info" title="Sửa giao dịch" onclick="updateTransaction('${tableList.id}','${customerEdit.id}')">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>
                                </div>
                            </display:column>
                        </display:table>
                    </div>
                </c:if>
                <c:if test="${item.key == 'DDX'}">
                    <div class="col-xs-12">
                        <display:table class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                       style="margin: 3em 0 1.5rem;font-family: 'Times New Roman';font-size: smaller"
                                       id="tableList"
                                       name="DDX">
                            <display:column title="Ngày tạo" property="createdDate"/>
                            <display:column title="Người tạo" property="createdBy"/>
                            <display:column title="Chi tiết giao dịch" property="note"/>
                            <display:column title="Thao tác">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-info" title="Sửa giao dịch" onclick="updateTransaction('${tableList.id}','${customerEdit.id}')">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>
                                </div>
                            </display:column>
                        </display:table>
                    </div>
                </c:if>
            </div>

        </c:forEach>
    </div>
</div>
<div class="modal fade" id="addOrUpdateTransaction" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="note">Chi tiết giao dịch</label>
                                </div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="note" name="note"/>
                                </div>

                            </div>
                        </div>
                    </div>
                <input type="hidden" id="code" name="code" value="" />
                <input type="hidden" id="customerId" name="customerId" value="">
                <div type="hidden" id="id" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAddOrUpdateTransaction"></button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
    </div>
</div>
<script>
    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#listForm').serializeArray();
        $.each(formData,function (i,v){
            data[""+v.name+""] = v.value;
        })
        if(data["fullName"] == null || data["phone"]==null){
            window.location.href = "<c:url value="/admin/customer-edit?fullName=required&phone=required"/>";
        }else{
            addOrUpdateCustomer(data);
        }
    })
    function addOrUpdateCustomer(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response){
                console.log("Success");
                showAlert("success", "Thêm khách hàng thành công!");
                window.location.href = "/admin/customer-list";
            },
            error: function(res){
                console.log("Failed");
                console.log(res.statusText);
            }
        })
    }
    $("#btnCancel").click(function (){
        window.location.href = "<c:url value="/admin/customer-list"/>";
    })

    function transactionType(code, customerId) {
        $('#addOrUpdateTransaction .modal-title').html("Nhập giao dịch");
        $('#btnAddOrUpdateTransaction').html("Thêm giao dịch");
        $('#code').val(code);
        $('#note').val("");
        $('#customerId').val(customerId);
        $('#addOrUpdateTransaction').modal('show');
    }

    function updateTransaction(transactionId,customerId){
        $('#addOrUpdateTransaction .modal-title').html("Sửa giao dịch");
        $('#btnAddOrUpdateTransaction').html("Cập nhật");
        $('#customerId').val(customerId);
        $('#id').val(transactionId);
        $('#addOrUpdateTransaction').modal('show');
        loadNote(transactionId);
    }

    function loadNote(transactionId) {
        $.ajax({
            type: "Get",
            url: "${transactionAPI}/" + transactionId,
            contentType: "application/json",
            dataType: "JSON",
            success: function (response){
                var note = response.data.note;
                $('#note').val(note);
                console.log("Success");
            },
            error: function (response){
                console.log("Failed");
                console.log(response);
            }
        });
    }

    $('#btnAddOrUpdateTransaction').click(function () {
        var data = {};
        data["id"] = $('#id').val();
        data["note"] = $('#note').val();
        data["customerId"] = $('#customerId').val();
        data["code"] = $('#code').val();
        addOrUpdateTransaction(data)
    })

    function addOrUpdateTransaction(data){
        $.ajax({
            type: "POST",
            url: "${transactionAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(response){
                console.log("Success");
                showAlertAndRedirect("Cập nhật thành công!", "/admin/customer-edit-" + data["customerId"]);
            },
            error: function(res){
                console.log("Failed");
                console.log(res.statusText);
            }
        })
    }

    function showAlert(type, message){
        // Xây dựng HTML cho thông báo
        var alertHTML = '<div class="alert alert-' + type + ' alert-dismissible fade show" role="alert">' +
            message +
            '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
            '</div>';
        // Thêm HTML vào trang
        $('#alertContainer').append(alertHTML);
    }
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
