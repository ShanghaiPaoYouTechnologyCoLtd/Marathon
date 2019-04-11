<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  <base href="<%=basePath%>" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>中国马拉松赛事联盟-关于我们</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<%@ include file="../staticFiles/globalScript.html"%>
  </head>

  <body>

<div class="kode_wrapper"> 
<%@ include file="../staticFiles/head.html"%>
    <div class="kode_content_wrap">
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <!--Featured Slider Start-->
                        <div class="kf_featured_slider">
                            <!--Heading 1 Start-->
                            <h6 class="kf_hd1">
                                <span>中国马拉松赛事联盟</span>
                            </h6>
                            <!--Heading 1 END-->
                            <p>中国马拉松赛事联盟（Chinese Marathon League,简称CML）是中国田径协会发起，由符合条件的全国各马拉松及相关运动赛事联合组成。旨在适应全国迅猛发展的马拉松及相关运动赛事数量的快速增长，吸引高水平赛事聚集，促进赛事间以及与国际同行间的培训、交流和协作，整合资源，共同开发市场，宣传、提升赛事的品牌形象，推动马拉松以及相关运动赛事健康发展。</p>
                            <div class="logo-area">
                                <img src="extra-images/CAA.png" alt="田协logo">
                                <img src="extra-images/CML.png" alt="中国马拉松赛事联盟logos">
                            </div>
                        </div>
                        <!--Featured Slider End-->
                        <!--Featured Slider Start-->
                        <div class="kf_featured_slider">
                            <!--Heading 1 Start-->
                            <h6 class="kf_hd1">
                                <span>跑友（上海）体育发展有限公司</span>
                            </h6>
                            <p>中国马拉松赛事联盟隶属于跑友（上海）体育发展有限公司<br/>
跑友（上海）体育发展有限公司是一家拥有国际、国内顶级赛事资源的专业体育平台公司。公司同时也是中国田径协会 中国马拉松赛事联盟独家官方运营商。</p>
                            <div class="row contact-details-container">
                                                       
                                <div class="col-md-6">
                                    <div class="icon-container">
                                        <i class="glyphicon glyphicon-phone-alt"></i>
                                    </div>
                                    <h3>客服电话</h3>
                                    <p>021-50897802-615</p>
                                </div>
                                <div class="col-md-6">
                                    <div class="icon-container"><i class="glyphicon glyphicon-envelope"></i></div>
                                    <h3>Email</h3>
                                    <p>service@caa-paoyou.com</p>
                                </div>
                            </div>
                        </div>
                        <!--Featured Slider End-->
                    </div>
                    <aside class="col-md-4">
                        <!--Widget Ranking Start-->
                        <div class="widget widget_ranking">
                            <!--Heading 1 Start-->
                            <h6 class="kf_hd1">
                                <span>中国马拉松赛事联盟APP</span>
                            </h6>
                            <!--Heading 1 END-->
                            <div class="col-row">
                                <img src="extra-images/download_app.png" class="center-block img-rounded" style="width: 60%;">
                            </div>
                        </div>
                        <div class="widget widget_ranking">
                            <!--Heading 1 Start-->
                            <h6 class="kf_hd1">
                                <span>中国马拉松赛事联盟公众号</span>
                            </h6>
                            <div class="col-row">
                                <img src="extra-images/wechat_code.jpg" class="center-block img-rounded" style="width: 60%;">
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </section>
    </div>
	<%@ include file="../staticFiles/foot.html"%>
</div>

  </body>
</html>

