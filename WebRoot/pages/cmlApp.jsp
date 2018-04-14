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

    <title>中国马拉松赛事联盟APP</title>
     <%@ include file="../staticFiles/globalCSS.html"%>
     <link href="css/appCommon.css" rel="stylesheet">
     <script src="js/jquery.js"></script>
  </head>

  <body>

<div class="kode_wrapper"> 
<%@ include file="../staticFiles/head.html"%>
    <section id="showcase" class="nine_section_wrapper">        
        <!--begin nine_section -->
        <div class="nine_section">   
            <!--begin row -->
            <div class="row">
                <!--begin twelvecol -->
                <div class="twelvecol">
                
                    <!--begin sixcol -->
                    <div class="sixcol padding_top left_fade">
                        
                        <!--begin features_title_wrapper -->
                        <div class="features_title_wrapper">
                            <span class="features_number">01</span>
                            <span class="features_separator">/</span>
                            <span class="features_title">中国马拉松护照<br>购买/补办/更换</span>
                        </div>
                        <!--end features_title_wrapper -->
                        
                        <p>中国马拉松护照一键购买/更换/补办<br>购买成功后，您可在APP查看自己的电子护照，持有中国马拉松护照的跑者可在赛道终点盖印完赛章，且在您的电子护照内页可查看电子完赛章，每完成一场马拉松赛事，您将获得相应的积分，积分累计到达指定等级将可获得相应的积分奖励。</p>
                        
                        <!--begin quotes -->
                        <div class="QR-code">
                            <i class="fa fa-quote-left fa-3x pull-left grey"></i>
                            <span><img src="extra-images/download_app.png" class="download-img"></span>
                            <!--begin sixcol -->
                            <div class="sixcol another-info" style="float:right;">
                                <ul>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 网上购买中国马拉松护照还可获得随机小礼品.</li>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 电子印章跟随比赛记录一同呈现，同时支持分享印章荣誉到三方平台.</li>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 跑马累计马拉松护照积分，积分可兑换相应奖励.</li>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 扫描左侧二维码即可下载中国马拉松赛事联盟APP.</li>
                                </ul>                         
                            </div>
                            <!--end sixcol -->
                        </div>
                        <!--end quotes --> 
                        
                    </div>
                    <!--end sixcol -->
                    
                    <!--begin sixcol -->
                    <div class="sixcol last right_fade">
                        
                        <img src="extra-images/shape-3.png" alt="picture">
                                                               
                    </div>
                    <!--end sixcol -->
                     
                </div>
                <!--end twelvecol -->
                
            </div>
            <!--end row -->
            
        </div>
        <!--end nine_section -->
        
    </section>
    <!--end nine_section -->

    <!--begin nine_section2_wrapper -->
    <section class="nine_section2_wrapper">
        
        <!--begin nine_section2 -->
        <div class="nine_section2">
          
            <!--begin row -->
            <div class="row">
                
                <!--begin twelvecol -->
                <div class="twelvecol">
                
                    <!--begin sixcol -->
                    <div class="sixcol left_fade">
                        
                        <img src="extra-images/shape-1.png" alt="picture" style="width:90%">
                                                               
                    </div>
                    <!--end sixcol -->
                    
                    <!--begin sixcol -->
                    <div class="sixcol last padding_top right_fade">

                        <!--begin features_title_wrapper -->
                        <div class="features_title_wrapper">
                            <span class="features_number">02</span>
                            <span class="features_separator">/</span>
                            <span class="features_title">赛事资讯<br>权威专业</span>
                        </div>
                        <!--end features_title_wrapper -->
                        
                        <p>赛事资讯早知道，最热门的跑马话题，最近的比赛信息，最贴心的比赛贴士，最完善的跑马周边游攻略，尽在中国马拉松赛事联盟APP. </p>
                        
                        <!--begin showcase_item -->
                        <div class="showcase_item">
                                
                            <span class="dropcaps_showcase"><i class="glyphicon glyphicon-list-alt"></i></span>
                            
                            <div class="text_align_left">
                                <h4 class="small_margins">为跑者打造专业赛事资讯平台</h4>
                                <p>专业权威的赛事内容资讯，盘点全年各大赛事，跑步资讯、马拉松比赛资讯专业门户网站。跑步是生活态度,中国马拉松赛事联盟APP致力推广跑步概念,跑步文化,跑步生活,跑步态度。</p>
                            </div>
                            
                        </div>
                        <!--end showcase_item -->
                        
                        <!--begin showcase_item -->
                        <div class="showcase_item">
                                
                            <span class="dropcaps_showcase"><i class="fa fa-camera-retro"></i></span>
                            
                            <div class="text_align_left">
                                <h4 class="small_margins">跑步人生</h4>
                                <p>" 在个人的局限性中，可以让自己有效地燃烧——哪怕是一丁点儿，这便是跑步一事的本质，也是活着一事的隐喻。"<br>——村上春树</p>
                            </div>
                            
                        </div>
                        <!--end showcase_item -->
                        
                    </div>
                    <!--end sixcol -->
                     
                </div>
                <!--end twelvecol -->
                
            </div>
            <!--end row -->
            
        </div>
        <!--end nine_section2 -->
        
    </section>
    <!--end nine_section2_wrapper -->

    <!--begin nine_section_wrapper -->
    <section id="showcase" class="nine_section_wrapper">        
        <!--begin nine_section -->
        <div class="nine_section">   
            <!--begin row -->
            <div class="row">
                <!--begin twelvecol -->
                <div class="twelvecol">
                
                    <!--begin sixcol -->
                    <div class="sixcol padding_top left_fade">
                        
                        <!--begin features_title_wrapper -->
                        <div class="features_title_wrapper">
                            <span class="features_number">03</span>
                            <span class="features_separator">/</span>
                            <span class="features_title">跑马成绩<br>记录跑马人生</span>
                        </div>
                        <!--end features_title_wrapper -->
                        
                        <p>最权威的马拉松赛事成绩<br>马拉松战绩记录了您的进步，您的汗水，您的努力，每一块奖牌都是由一步步踏实的步伐汇聚而成。而我们，则是为记录您每一场跑马挥洒下的汗水与荣耀而生。</p>
                        
                        <!--begin quotes -->
                        <div>
                            <i class="fa fa-quote-left fa-3x pull-left grey"></i>
                            <!-- <span><img src="extra-images/download_app.png" style="width:35%"></span> -->
                            <!--begin sixcol -->
                            <div class="sixcol another-info" style="float:left;width:80%;">
                                <ul>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 马拉松是一项有魅力的运动。它包含了一切——戏剧成分，竞争，友情，英雄主义。不是每个跑者成为奥运冠军的梦想都可以成真，但是每一个人都可以梦想去完成一次马拉松比赛。</li>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 跑马拉松是疯狂的另一种表现。</li>
                                    <li><i class="fa fa-check grey"></i> &nbsp; 当你站在起跑线上，将自己展现在陌生人面前时，你会感受并铭记那令你自己无比兴奋的瞬间。</li>
                                </ul>                         
                            </div>
                            <!--end sixcol -->
                        </div>
                        <!--end quotes --> 
                        
                    </div>
                    <!--end sixcol -->
                    
                    <!--begin sixcol -->
                    <div class="sixcol last right_fade">
                        
                        <img src="extra-images/shape-2.png" alt="picture">
                                                               
                    </div>
                    <!--end sixcol -->
                     
                </div>
                <!--end twelvecol -->
                
            </div>
            <!--end row -->
            
        </div>
        <!--end nine_section -->
        
    </section>
    <!--end nine_section -->

    <!-- begin testimonials_wrapper -->
    <div class="testimonials_wrapper">
        <div class="testimonials_box bounce_fade">
            <span class="testimonials_img"><i class="fa fa-quote-right fa-3x white"></i></span><br>
            <span class="testimonials_text">"让专业跑进生活"</span>
            <span class="testimonials_autor">- 中国马拉松赛事联盟 -</span>
        </div>
    </div>
    <!-- end testimonials_wrapper -->

    <!--begin info_white_wrapper -->
    <div id="services" class="info_white_wrapper">
        
        <!--begin info_white -->
        <div class="info_white bounce_fade">
            <h3>四大优点</h3>
            <h4></h4>
        </div>
        <!--end info_white -->
            
    </div>
    <!--end info_white_wrapper -->

    <!--begin nine_section_wrapper -->
    <section class="nine_section_wrapper">
        
        <!--begin nine_section -->
        <div class="nine_section up_fade">
       
            <!--begin row -->
            <div class="row">
            
                <!--begin twelvecol -->
                <div class="twelvecol">
                    
                    <!--begin threecol -->
                    <div class="threecol">
                        
                        <!--begin services_homepage_item -->
                        <div class="services_homepage_item">
                            <div class="icon_wrapper">
                                <div class="icon_box">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-wanshanziliao"></use>
                                    </svg>
                                </div>
                            </div>
                            <h2>最完整</h2>
                            <p>最全的跑马数据，让每一场跑马历程，都有迹可寻</p>
                        </div>
                        <!--end services_homepage_item -->
                        
                    </div>
                    <!--end threecol -->
                    
                    <!--begin threecol -->
                    <div class="threecol">
                        
                        <!--begin services_homepage_item -->
                        <div class="services_homepage_item">
                            <div class="icon_wrapper">
                                <div class="icon_box">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-zhuanye"></use>
                                    </svg>
                                </div>
                            </div>
                            <h2>最专业</h2>
                            <p>最专业的跑马建议，最专业的装备推荐，最专业的赛事分析</p>
                        </div>
                        <!--end services_homepage_item -->
                        
                    </div>
                    <!--end threecol -->
                    
                    <!--begin threecol -->
                    <div class="threecol">
                        
                        <!--begin services_homepage_item -->
                        <div class="services_homepage_item">
                            <div class="icon_wrapper">
                                <div class="icon_box">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-quanwei"></use>
                                    </svg>
                                </div>
                            </div>
                            <h2>最权威</h2>
                            <p>最权威的官方跑马数据分析</p>
                        </div>
                        <!--end services_homepage_item -->
                        
                    </div>
                    <!--end threecol -->
                    
                    <!--begin threecol -->
                    <div class="threecol last">
                        
                        <!--begin services_homepage_item -->
                        <div class="services_homepage_item last">
                            <div class="icon_wrapper">
                                <div class="icon_box">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-yijiangoumai"></use>
                                    </svg>
                                </div>
                            </div>
                            <h2>最方便</h2>
                            <p>中国马拉松护照一键办理/补办/更换</p>
                        </div>
                        <!--end services_homepage_item -->
                        
                    </div>
                    <!--end threecol -->
                    
                </div>
                <!--end twelvecol -->
                
            </div>
            <!--end row -->
            
        </div>
        <!--end nine_section -->
         
    </section>
	<%@ include file="../staticFiles/foot.html"%>
</div>

    </body>
<%@ include file="../staticFiles/globalScript.html"%>
</html>

