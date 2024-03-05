<%--
  Created by IntelliJ IDEA.
  User: Hien
  Date: 3/4/2024
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value = "/admin/building-list" />
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
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
                <li class="active">Quản lý tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
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
                                <form:form modelAttribute="modelSearch" action='${buildingListURL}' id="listForm" method="get">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <label class="name">Tên tòa nhà</label>
                                                        <form:input class="form-control" path="name" />
<%--                                                    <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="name">Diện tích sàn</label>
<%--                                                    <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input class="form-control" path="floorArea"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-2">
                                                    <label class="name">Quận</label>
                                                    <select class="form-control" name="district">
                                                        <option value="">--Chọn Quận--</option>
                                                        <option value="QUAN_1" ${modelSearch.district== "QUAN_1" ? "selected" : ""}>Quận 1</option>
                                                        <option value=QUAN_2>Quận 2</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label class="name">Phường</label>
<%--                                                    <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                        <form:input class="form-control" path="ward"/>
                                                </div>
                                                <div class="col-sm-5">
                                                    <label class="name">Đường</label>
                                                    <input type="text" class="form-control" name="street" value="${modelSearch.street}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-4">
                                                    <label class="name">Số tầng hầm</label>
                                                    <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">
                                                </div>
                                                <div class="col-sm-4">
                                                    <label class="name">Hướng</label>
                                                    <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">
                                                </div>
                                                <div class="col-sm-4">
                                                    <label class="name">Hạng</label>
                                                    <input type="number" class="form-control" name="level" value="${modelSearch.level}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-3">
                                                    <label class="name">Diện tích từ</label>
                                                    <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="name">Diện tích đến</label>
                                                    <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="name">Giá thuê từ</label>
                                                    <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label class="name">Giá thuê đến</label>
                                                    <input type="number" class="form-control" name="rentPriceTo" value="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-5">
                                                    <label class="name">Tên quản lý</label>
                                                    <input type="text" class="form-control" name="managerName" value="">
                                                </div>
                                                <div class="col-sm-5">
                                                    <label class="name">Điện thoại quản lý</label>
                                                    <input type="text" class="form-control" name="managerphone" value="">
                                                </div>
                                                <div class="col-sm-2">
                                                    <label class="name">Nhân viên phụ trách</label>
                                                    <select class="form-control" name="staffId">
                                                        <option value="">--Chọn nhân viên--</option>
                                                        <option value="1">nguyen van a</option>
                                                        <option value="2">nguyen van b</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" name="typeCode" value="noi-that"> Nội thất
                                                    </label>
                                                    <label class="checkbox-inline" name="typeCode" value="nguyen-can">
                                                        <input type="checkbox"> Nguyên căn
                                                    </label>
                                                    <label class="checkbox-inline" name="typeCode" value="tang-tret">
                                                        <input type="checkbox"> Tầng trệt
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
                                                    <button type="button" class="btn btn-danger" style="border: 0;" id="btnSearchBuilding">
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
                    <div class="pull-right">
                        <a href="/admin/building-edit">
                            <button class="btn btn-primary" title="Thêm tòa nhà" style="border: 0;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </a>
                        <button class="btn btn-danger" title="Xóa tòa nhà" style="border: 0;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Bảng danh sách -->
            <div class="row">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin: 3em 0 1.5rem;font-family: 'Times New Roman';font-size: smaller">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên tòa nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại quản lý</th>
                            <th>D.tích sàn</th>
                            <th>D.tích trống</th>
                            <th>D.tích thuê</th>
                            <th>Giá thuê</th>
                            <th>Phí mua giới</th>
                            <th>Phí dịch vụ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="item" items="${buildingList}">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td class="text-nowrap">${item.name}</td>
                                <td class="text-nowrap">${item.address}</td>
                                <td class="text-nowrap">${item.numberOfBasement}</td>
                                <td class="text-nowrap">${item.managerName}</td>
                                <td class="text-nowrap">${item.managerPhone}</td>
                                <td class="text-nowrap">${item.floorArea}</td>
                                <td class="text-nowrap">${item.emptyArea}</td>
                                <td class="text-nowrap">${item.rentArea}</td>
                                <td class="text-nowrap">${item.rentPrice}</td>
                                <td class="text-nowrap">${item.brokerageFee}</td>
                                <td class="text-nowrap">${item.serviceFee}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                        </button>
                                        <button class="btn btn-xs btn-info" title="Sửa tòa nhà">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<!-- Modal -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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
                    <tr>
                        <td class="center">
                            <input type="checkbox" id="checkbox_1" value="1" checked>
                        </td>
                        <td>Nguyen Van A</td>
                    </tr>
                    <tr>
                        <td class="center">
                            <input type="checkbox" id="checkbox_2" value="2" checked>
                        </td>
                        <td>Nguyen Van B</td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        $("#buildingId").val(buildingId);
        $('#btnAssignmentBuilding').click(function(e){
            e.preventDefault();
            var data = {};
            data['buildingId'] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data["staffs"] = staffs;
            console.log("OK");
        });
    }

    $("#btnSearchBuilding").click(function (e){
        e.preventDefault();

        $("#listForm").submit();
    });
</script>
</body>
</html>
