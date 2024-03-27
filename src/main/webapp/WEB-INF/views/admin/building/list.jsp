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
<c:url var="buildingAPI" value="/admin/building" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                                                    <form:select class="form-control" path="district">
                                                        <form:option value="">--Chọn Quận--</form:option>
                                                        <form:options items="${districts}"></form:options>
                                                    </form:select>
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
                                                    <form:select class="form-control" path="staffId">
                                                        <form:option value="">--Chọn nhân viên--</form:option>
                                                        <form:options items="${listStaffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-sm-6">
<%--                                                    <label class="checkbox-inline">--%>
<%--                                                        <input type="checkbox" name="typeCode" value="noi-that"> Nội thất--%>
<%--                                                    </label>--%>
<%--                                                    <label class="checkbox-inline" name="typeCode" value="nguyen-can">--%>
<%--                                                        <input type="checkbox"> Nguyên căn--%>
<%--                                                    </label>--%>
<%--                                                    <label class="checkbox-inline" name="typeCode" value="tang-tret">--%>
<%--                                                        <input type="checkbox"> Tầng trệt--%>
<%--                                                    </label>--%>
                                                    <form:checkboxes items="${buildingType}" path="typeCode"/>
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
                        <button class="btn btn-danger" title="Xóa tòa nhà" style="border: 0;" id="btnDeleteBuilding">
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
                    <div class="table-responsive">
                        <display:table name="buildingList.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="${buildingListURL}" partialList="true" sort="external"
                                   size="${buildingList.totalItem}" defaultsort="2" defaultorder="ascending"
                                   id="tableList" pagesize="${buildingList.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <!-- Các cột của bảng -->
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column title="Tên tòa nhà" property="name"/>
                        <display:column title="Địa chỉ" property="address"/>
                        <display:column title="Số tầng hầm" property="numberOfBasement"/>
                        <display:column title="Tên quản lý" property="managerName"/>
                        <display:column title="Số điện thoại quản lý" property="managerPhone"/>
                        <display:column title="D.tích sàn" property="floorArea"/>
                        <display:column title="D.tích trống" property="emptyArea"/>
                        <display:column title="D.tích thuê" property="rentArea"/>
                        <display:column title="Giá thuê" property="rentPrice"/>
                        <display:column title="Phí mua giới" property="brokerageFee"/>
                        <display:column title="Phí dịch vụ" property="serviceFee"/>

                        <!-- Cột thao tác -->
                        <display:column title="Thao tác">
                            <div class="hidden-sm hidden-xs btn-group">
                                <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
                                    <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                </button>
                                <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </a>
                                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                </button>
                            </div>
                        </display:column>
                        </display:table>
                    </div>
<%--                    <display:table id="tableList" class="table table-striped table-bordered table-hover" style="margin: 3em 0 1.5rem;font-family: 'Times New Roman';font-size: smaller">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th class="center">--%>
<%--                                <label class="pos-rel">--%>
<%--                                    <input type="checkbox" class="ace">--%>
<%--                                    <span class="lbl"></span>--%>
<%--                                </label>--%>
<%--                            </th>--%>
<%--                            <th>Tên tòa nhà</th>--%>
<%--                            <th>Địa chỉ</th>--%>
<%--                            <th>Số tầng hầm</th>--%>
<%--                            <th>Tên quản lý</th>--%>
<%--                            <th>Số điện thoại quản lý</th>--%>
<%--                            <th>D.tích sàn</th>--%>
<%--                            <th>D.tích trống</th>--%>
<%--                            <th>D.tích thuê</th>--%>
<%--                            <th>Giá thuê</th>--%>
<%--                            <th>Phí mua giới</th>--%>
<%--                            <th>Phí dịch vụ</th>--%>
<%--                            <th>Thao tác</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>

<%--                        <tbody>--%>
<%--                        <c:forEach var="item" items="${buildingList}">--%>
<%--                            <tr>--%>
<%--                                <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                                <td class="text-nowrap">${item.name}</td>--%>
<%--                                <td class="text-nowrap">${item.address}</td>--%>
<%--                                <td class="text-nowrap">${item.numberOfBasement}</td>--%>
<%--                                <td class="text-nowrap">${item.managerName}</td>--%>
<%--                                <td class="text-nowrap">${item.managerPhone}</td>--%>
<%--                                <td class="text-nowrap">${item.floorArea}</td>--%>
<%--                                <td class="text-nowrap">${item.emptyArea}</td>--%>
<%--                                <td class="text-nowrap">${item.rentArea}</td>--%>
<%--                                <td class="text-nowrap">${item.rentPrice}</td>--%>
<%--                                <td class="text-nowrap">${item.brokerageFee}</td>--%>
<%--                                <td class="text-nowrap">${item.serviceFee}</td>--%>
<%--                                <td>--%>
<%--                                    <div class="hidden-sm hidden-xs btn-group">--%>
<%--                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">--%>
<%--                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>--%>
<%--                                        </button>--%>
<%--                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">--%>
<%--                                            <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
<%--                                        </a>--%>
<%--                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">--%>
<%--                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
<%--                                        </button>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        </tbody>--%>
<%--                    </display:table>--%>
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
<%--                    <tr>--%>
<%--                        <td class="center">--%>
<%--                            <input type="checkbox" id="checkbox_1" value="1" checked>--%>
<%--                        </td>--%>
<%--                        <td>Nguyen Van A</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td class="center">--%>
<%--                            <input type="checkbox" id="checkbox_2" value="2" checked>--%>
<%--                        </td>--%>
<%--                        <td>Nguyen Van B</td>--%>
<%--                    </tr>--%>
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
        loadStaff(buildingId);
        $("#buildingId").val(buildingId);
        $('#btnAssignmentBuilding').click(function(e){
            e.preventDefault();
            var data = {};
            data['buildingId'] = $('#buildingId').val();
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
            url: "${buildingAPI}/assignment",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond){
                console.log("Success");
                window.location.href = "<c:url value="/admin/building-list"/>";
            },
            error: function (respond){
                console.log("Failed");
                console.log(respond);
            }
        });
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "Get",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            // data: JSON.stringify(data),
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

    $("#btnSearchBuilding").click(function (e){
        e.preventDefault();

        $("#listForm").submit();
    });

    function deleteBuilding(buildingId){
        var buildingId = [buildingId];
        deleteBuildings(buildingId);
    }

    $("#btnDeleteBuilding").click(function (e){
        e.preventDefault();
        var data = {};
        var buildingIds = $("#tableList").find("tbody input[type = checkbox]:checked").map(function (){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data){
        $.ajax({
            type: "Delete",
            url: "${buildingAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (respond){
                console.log("Success");
                window.location.href = "<c:url value="/admin/building-list"/>";
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
