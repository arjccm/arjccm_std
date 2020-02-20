<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">


    <title>疫情人员添加</title>
    <meta name="author" content="pixelcave">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="img/favicon.css">
    <link rel="apple-touch-icon" href="img/icon57.css" sizes="57x57">
    <link rel="apple-touch-icon" href="img/icon72.css" sizes="72x72">
    <link rel="apple-touch-icon" href="img/icon76.css" sizes="76x76">
    <link rel="apple-touch-icon" href="img/icon114.css" sizes="114x114">
    <link rel="apple-touch-icon" href="img/icon120.css" sizes="120x120">
    <link rel="apple-touch-icon" href="img/icon144.css" sizes="144x144">
    <link rel="apple-touch-icon" href="img/icon152.css" sizes="152x152">
    <link rel="apple-touch-icon" href="img/icon180.css" sizes="180x180">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/plugins.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/themes.css">
    <script src="js/vendor/modernizr-3.3.1.min.js"></script>
</head>
<body>

<div id="page-wrapper" class="page-loading">
    <div id="page-container" class="header-fixed-top sidebar-visible-lg-full">
        <!-- Main Container -->
        <div id="main-container">
            <header class="navbar navbar-inverse navbar-fixed-top">
                <ul class="nav navbar-nav-custom">
                    <li>
                        <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                            <i class="fa fa-ellipsis-v fa-fw animation-fadeInRight" id="sidebar-toggle-mini"></i>
                            <i class="fa fa-bars fa-fw animation-fadeInRight" id="sidebar-toggle-full"></i>
                        </a>
                    </li>
                    <li class="hidden-xs animation-fadeInQuick">
                        <a href=""><h4></h4></a>
                    </li>
                </ul>
            </header>
            <div id="page-content">
                <!-- Validation Header -->
                <div class="content-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="header-section">
                                <h1>疫情人口管理</h1>
                            </div>
                        </div>
                        <div class="col-sm-6 hidden-xs">
                            <div class="header-section">
                                <ul class="breadcrumb breadcrumb-top">
                                    <li>人口管理</li>
                                    <li>疫情人口管理</li>
                                    <li><a href="">疫情人员添加</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Validation Header -->

                <!-- Form Validation Content -->
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                        <!-- Form Validation Block -->
                        <div class="block">
                            <!-- Form Validation Title -->
                            <%--<div class="block-title">
                                <h2>人员疫情添加</h2>
                            </div>--%>
                            <!-- END Form Validation Title -->

                            <!-- Form Validation Form -->
                            <form id="inputForm" action="" method="post" class="form-horizontal form-bordered">
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="name">姓名： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" name="name" class="form-control required" htmlEscape="false" maxlength="32"  placeholder="请输入姓名">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">性别：</label>
                                    <div class="col-md-9">
                                        <label class="radio-inline" for="example-inline-radio1">
                                            <input type="radio" id="example-inline-radio1" name="sex" value="0"> 男
                                        </label>
                                        <label class="radio-inline" for="example-inline-radio2">
                                            <input type="radio" id="example-inline-radio2" name="sex" value="1"> 女
                                        </label>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label class="col-md-3 control-label" for="agetype">年龄： &lt;%&ndash;<span class="text-danger">*</span>&ndash;%&gt;</label>
                                    <div class="col-md-6">
                                        <input type="text" id="agetype" name="agetype" class="form-control required" htmlEscape="false" maxlength="32"  placeholder="请输年龄">
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="idNumber">身份证号码： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="idNumber" name="idNumber" class="form-control required" htmlEscape="false" maxlength="32"  placeholder="请输入身份证号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="comeHainanDate">到达时间：</label>
                                    <div class="col-md-6">
                                        <input type="text" id="comeHainanDate" name="comeHainanDate" class="form-control input-datepicker" data-date-format="yyyy-mm-dd" placeholder="年-月-日">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="telephone">电话号码： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="telephone" name="telephone" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入电话号码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="habitation">当地居住地： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="habitation" name="habitation" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入当地居住地">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="transportation">返程交通工具：<%-- <span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="transportation" name="transportation" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入返程交通工具">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="health">身体状况：</label>
                                    <div class="col-md-6">
                                        <select id="health" name="health" class="form-control" size="1">
                                            <option value="0">正常
                                            <option value="1">非正常
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="takeSteps">采取何种措施：</label>
                                    <div class="col-md-6">
                                        <select id="takeSteps" name="takeSteps" class="form-control" size="1">
                                            <option value="1">居家隔离
                                            <option value="2">留观点隔离
                                            <option value="3">确诊住院
                                            <option value="4">医院隔离
                                            <option value="5">无
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="checkName">核查人：<%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="checkName" name="checkName" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入核查人">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="checkTel">核查人联系方式： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="checkTel" name="checkTel" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入核查人联系方式">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="checkDate">核查时间：</label>
                                    <div class="col-md-6">
                                        <input type="text" id="checkDate" name="checkDate" class="form-control input-datepicker" data-date-format="yyyy-mm-dd" placeholder="年-月-日">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="reportName">上报人：<%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="reportName" name="reportName" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入上报人">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="reportDepartment">上报人所属单位： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="reportDepartment" name="reportDepartment" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入上报人所属单位">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="reportDate">上报时间：</label>
                                    <div class="col-md-6">
                                        <input type="text" id="reportDate" name="reportDate" class="form-control input-datepicker" data-date-format="yyyy-mm-dd" placeholder="年-月-日">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="reportStatus">上报状态：</label>
                                    <div class="col-md-6">
                                        <select id="reportStatus" name="reportStatus" class="form-control" size="1">
                                            <option value="1">待上报
                                            <option value="2">已上报
                                            <option value="3">核销上报
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="belongBureau">所属市局： <%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="belongBureau" name="belongBureau" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入所属市局">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="belongSubBureau">所属分局：<%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="belongSubBureau" name="belongSubBureau" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入所属分局">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label" for="belongPoliceStation">所属派出所：<%--<span class="text-danger">*</span>--%></label>
                                    <div class="col-md-6">
                                        <input type="text" id="belongPoliceStation" name="belongPoliceStation" class="form-control" htmlEscape="false" maxlength="32"  placeholder="请输入所属派出所">
                                    </div>
                                </div>
                              <%--  <div class="form-group">
                                    <label class="col-md-3 control-label" for="remarks">备注信息： &lt;%&ndash;<span class="text-danger">*</span>&ndash;%&gt;</label>
                                    <div class="col-md-9">
                                        <textarea id="remarks" name="remarks" rows="7" class="form-control" placeholder="请输入备注信息"></textarea>
                                    </div>
                                </div>--%>
                                <div class="form-group form-actions">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button type="submit" class="btn btn-effect-ripple btn-primary" onclick="save()">提交</button>
                                        <button type="reset" class="btn btn-effect-ripple btn-danger">取消</button>
                                    </div>
                                </div>

                            </form>
                            <!-- END Form Validation Form -->

                        </div>
                        <!-- END Form Validation Block -->
                    </div>
                </div>
                <!-- END Form Validation Content -->
            </div>
            <!-- END Page Content -->
        </div>
        <!-- END Main Container -->
    </div>
    <!-- END Page Container -->
</div>
<!-- END Page Wrapper -->

<!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
<script src="js/vendor/jquery-2.2.4.min.js"></script>
<script src="js/vendor/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/app.js"></script>

<!-- Load and execute javascript code used only in this page -->
<script src="js/pages/formsValidation.js"></script>
<script>$(function(){ FormsValidation.init(); });</script>
</body>
</html>