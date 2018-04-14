<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
  <base href="<%=basePath%>" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<base href="<%=basePath%>" />
    <title>我要上奥运 ▪ 中国马拉松大奖赛</title>
    <%@ include file="../staticFiles/globalCSS.html"%>
        <script src="js/jquery.js"></script>
  </head>

  <body>

<div class="kode_wrapper"> 
<%@ include file="../staticFiles/head.html"%>
    <div class="kode_content_wrap">
        <section class="kf_overview_page">
            <div class="container">
                <div class="overview_wrap">
                    <div class="row">
                        <div class="col-md-8">
                            <!--events info Start-->
                            <div class="kf_featured_wrap3">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <!--Featured 3 thumb Start-->
                                        <div class="kf_featured_thumb">
                                            <figure>
                                                <img src="extra-images/feature_3.jpg" alt="">
                                            </figure>
                                            <div class="text_wrper">
                                                <div class="text">
                                                    <!-- <h6>无锡马拉松</h6>                                 -->
                                                    <h2>北京马拉松</h2>
                                                    <span>2018.3.25 / 无锡</span>
                                                    <p>北京马拉松自1981年开始创办，是国内历史最为悠久，连续举办时间最长的单项自主品牌马拉松赛事。该赛事经国际田联（IAAF）认证、国际马拉松及公路跑协会（AIMS）备案，由中国田径协会、北京市体育局主办</p>
                                                    <a class="btn_2" href="matchDetails.html">查看更多</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Featured 3 thumb End-->
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <!--Featured 3 thumb Start-->
                                        <div class="kf_featured_thumb">
                                            <figure>
                                                <img src="extra-images/feature_3.jpg" alt="">
                                            </figure>
                                            <div class="text_wrper">
                                                <div class="text">
                                                    <!-- <h6>无锡马拉松</h6>                                 -->
                                                    <h2>北京马拉松</h2>
                                                    <span>2018.3.25 / 无锡</span>
                                                    <p>北京马拉松自1981年开始创办，是国内历史最为悠久，连续举办时间最长的单项自主品牌马拉松赛事。该赛事经国际田联（IAAF）认证、国际马拉松及公路跑协会（AIMS）备案，由中国田径协会、北京市体育局主办</p>
                                                    <a class="btn_2" href="matchDetails.html">查看更多</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Featured 3 thumb End-->
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <!--Featured 3 thumb Start-->
                                        <div class="kf_featured_thumb">
                                            <figure>
                                                <img src="extra-images/feature_3.jpg" alt="">
                                            </figure>
                                            <div class="text_wrper">
                                                <div class="text">
                                                    <!-- <h6>无锡马拉松</h6>                                 -->
                                                    <h2>北京马拉松</h2>
                                                    <span>2018.3.25 / 无锡</span>
                                                    <p>北京马拉松自1981年开始创办，是国内历史最为悠久，连续举办时间最长的单项自主品牌马拉松赛事。该赛事经国际田联（IAAF）认证、国际马拉松及公路跑协会（AIMS）备案，由中国田径协会、北京市体育局主办</p>
                                                    <a class="btn_2" href="matchDetails.html">查看更多</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Featured 3 thumb End-->
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <!--Featured 3 thumb Start-->
                                        <div class="kf_featured_thumb">
                                            <figure>
                                                <img src="extra-images/feature_3.jpg" alt="">
                                            </figure>
                                            <div class="text_wrper">
                                                <div class="text">
                                                    <!-- <h6>无锡马拉松</h6>                                 -->
                                                    <h2>北京马拉松</h2>
                                                    <span>2018.3.25 / 无锡</span>
                                                    <p>北京马拉松自1981年开始创办，是国内历史最为悠久，连续举办时间最长的单项自主品牌马拉松赛事。该赛事经国际田联（IAAF）认证、国际马拉松及公路跑协会（AIMS）备案，由中国田径协会、北京市体育局主办</p>
                                                    <a class="btn_2" href="matchDetails.html">查看更多</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Featured 3 thumb End-->
                                    </div>
                                </div>    
                                <!--Pagination Start-->
                                <nav class="pagination-btns">
                                    <ul class="pagination">
                                        <li class="disabled">
                                            <span>
                                                <span aria-hidden="true">&laquo;</span>
                                            </span>
                                        </li>
                                        <li class="active">
                                            <span>1 <span class="sr-only"></span></span>
                                        </li>
                                        <li>
                                            <span>2 <span class="sr-only"></span></span>
                                        </li>
                                        <li>
                                            <span>3 <span class="sr-only"></span></span>
                                        </li>
                                        <li>
                                            <span>
                                                <span aria-hidden="true">&raquo;</span>
                                            </span>
                                        </li>
                                    </ul>
                                </nav>
                                <!--Pagination End-->
                            </div>
                            <!--events info End-->
                        </div>
                        <aside class="col-md-4">
                            <!--Widget League Table Start-->
                            <div class="widget widget_ranking widget_league_table">
                                <!--Heading 1 Start-->
                                <h6 class="kf_hd1">
                                    <span>成员赛事概览</span>
                                </h6>
                                <!--Heading 1 END-->
                                <div class="kf_border">
                                    <!--Table Wrap Start-->
                                    <ul class="kf_table">
                                        <li class="table_head">
                                            <div class="team_name">
                                                <strong>赛事</strong>
                                            </div>
                                            <div class="team_logo">
                                            </div>
                                            <div class="match_loss">
                                                <strong>比赛时间</strong>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>1</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>2</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>3</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>4</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>5</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>6</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>7</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>8</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>9</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>10</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>11</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>12</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>13</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>14</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="table_no">
                                                <span>15</span>
                                            </div>
                                            <div class="team_logo">
                                                <a href="#">黄河口（东营）国际马拉松</a>
                                            </div>
                                            <div class="match_win">
                                                <span>2018/3/25</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <!--Table Wrap End-->
                                </div>
                            </div>
                            <!--Widget League Table End-->
                        </aside>
                    </div>
                </div>
            </div>
        </section>
    </div>
	<%@ include file="../staticFiles/foot.html"%>
</div>

  </body>
</html>

