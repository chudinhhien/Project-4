<%--
  Created by IntelliJ IDEA.
  User: Hien
  Date: 3/4/2024
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    Sửa hoặc thêm tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                </div>
            </div>

        <form:form modelAttribute="buildingEdit" id="listForm" method="get">
            <!-- Bảng danh sách -->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" id="form-edit">
                        <div class="form-group">
                            <label class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="name" name="name">--%>
                                <form:input class="form-control" path="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-2">
                                <select class="form-control" id="district" name="district">
                                    <option value="">--Chọn Quận--</option>
                                    <option value="1">Quận 1</option>
                                    <option value="2">Quận 2</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="ward" name="ward">--%>
                                <form:input class="form-control" path="ward"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="street" name="street">--%>
                                <form:input class="form-control" path="street"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="structure" name="structure">--%>
                                <form:input class="form-control" path="structure"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement">--%>
                                <form:input class="form-control" path="numberOfBasement"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="number" id="floorArea" name="floorArea">--%>
                                <form:input class="form-control" path="floorArea"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="direction" name="direction">--%>
                                <form:input class="form-control" path="direction"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="number" id="level" name="level">--%>
                                <form:input class="form-control" path="level"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="rentArea" name="rentArea">--%>
                                <form:input class="form-control" path="rentArea"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="number" id="rentPrice" name="rentPrice">--%>
                                <form:input class="form-control" path="rentPrice"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription">--%>
                                <form:input class="form-control" path="rentPriceDescription"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
<%--                                <input class="form-control" type="number" id="serviceFee" name="serviceFee">--%>
                                <form:input class="form-control" path="serviceFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="carFee" name="carFee">
                                <form:input class="form-control" path="carFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="motorbikeFee" name="motorbikeFee">
                                <form:input class="form-control" path="motorbikeFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="overTimeFee" name="overTimeFee">
                                <form:input class="form-control" path="overtimeFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="electricityFee" name="electricityFee">
                                <form:input class="form-control" path="electricityFee"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="deposit" name="deposit">
                                <form:input class="form-control" path="deposit"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="payment" name="payment">
                                <form:input class="form-control" path="payment"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thời gian thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="date" id="rentTime" name="rentTime">
                                <form:input class="form-control" path="rentTime"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="date" id="decorationTime" name="decorationTime">
                                <form:input class="form-control" path="decorationTime"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Tên quản lý</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managerName" name="managerName">
                                <form:input class="form-control" path="managerName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">SĐT quản lý</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managerphone" name="managerphone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Phí môi giới</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="brokeragefee" name="brokeragefee">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Loại tòa nhà</label>
                            <div class="col-xs-9">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="noi-that">Nội thất
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="nguyen-can">Nguyên căn
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="typeCode" value="tang-tret">Tầng trệt
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <textarea class="form-control"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm tòa nhà</button>
                                <button type="button" class="btn btn-danger">Hủy thao tác</button>
                            </div>
                        </div>

                    </form>
                </div><!-- /.span -->
            </div>
        </form:form>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script>
    $('#btnAddBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData,function(i,v){
            if(v.name != 'typeCode'){
                data["" + v.name + ""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        });
        data['typeCode'] = typeCode;
        //Call API
        $.ajax({
            type: "POST",
            url: "",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function(res){
                console.log("Success");
            },
            error: function(res){
                console.log("Failed");
                console.log(res.statusText);
            }
        })
    });
</script>
</body>
</html>
