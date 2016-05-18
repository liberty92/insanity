<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row" style="width: 100%; margin: auto">
    <div id="Tab-container"> 
        <div class="row">
            <ul id="Tab-container-nav" class="clearfix">
                <li><a   onmouseclick="tabber1.show(1); return false"><span><strong>Thông báo </strong></span></a></li>
                <li><a   onmouseclick="tabber1.show(2); return false"><span><strong>Tin tức</strong></span></a></li>
                <li><a   onmouseclick="tabber1.show(3); return false"><span><strong>Quy trình - thủ tục</strong></span></a></li>
            </ul>
        </div>
        <!--Tab 1-->
        <div class="row tab clearfix" id="tab1">
            <div class="Tab-page-thumb">
                <img src="${pageContext.request.contextPath}/resources/images/core/banner1.jpg" width="270" height="503" />
            </div>

            <div class="">
                <ul class="Tabpage-items">

                    <!--start-->
                    <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
                        <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
                            <a style="font-size: 18px; te" href="#" 
                            class="Title">
                            Demo title 1
                        </a>
                    </div>
                    <br/>
                    <div style="width: 475; height: 120px; max-height: 120px;">
                        <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
                            <font face="verdana" color="grey" >
                                Demo summary 1
                            </font>
                        </div>
                        <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
                            <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
                        </div>
                    </div>
                </div>
                <!--ends-->


                <!--start-->
                <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
                    <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
                        <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i32 ?>" 
                           class="Title">
                           Demo title 2
                       </a>
                   </div>
                   <br/>
                   <div style="width: 475; height: 120px; max-height: 120px;">
                    <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
                        <font face="verdana" color="grey" >
                            Demo summary 2  
                        </font>
                    </div>
                    <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
                        <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
                    </div>
                </div>
            </div>
            <!--ends-->

            <!--start-->
            <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
                <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
                    <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i33 ?>"  class="Title">
                       Demo title 3
                   </a>
               </div>
               <br/>
               <div style="width: 475; height: 120px; max-height: 120px;">
                   <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
                        <font face="verdana" color="grey" >
                            Demo summary 3  
                        </font>
                    </div>
                    <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
                        <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
                    </div>
                </div>
            </div>
        <!--ends-->
    </ul>
</div>
</div>

<!--Tab 2-->

<div class="tab clearfix" id="tab2">
    <div class="Tab-page-thumb">
        <img src="${pageContext.request.contextPath}/resources/images/core/banner2.jpg"  width="270" height="503" />
    </div>

    <!--start-->
    <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
        <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
            <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i1 ?>" 
               class="Title">
               Demo title 1
           </a>
       </div>
       <br/>
       <div style="width: 475; height: 120px; max-height: 120px;">
        <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
            <font face="verdana" color="grey" >
                Demo summary 1 
            </font>
        </div>
        <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
            <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
        </div>
    </div>
</div>
<!--ends-->

<!--start-->
<div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
    <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
        <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i2 ?>" 
           class="Title">
           Demo title 2
       </a>
   </div>
   <br/>
   <div style="width: 475; height: 120px; max-height: 120px;">
    <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
        <font face="verdana" color="grey" >
            Demo summary 2  
        </font>
    </div>
    <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
        <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
    </div>
</div>
</div>
<!--ends-->

<!--start-->
<div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
    <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
        <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i3 ?>" 
           class="Title">
           Demo title 3 
       </a>
   </div>
   <br/>
   <div style="width: 475; height: 120px; max-height: 120px;">
    <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
        <font face="verdana" color="grey" >
            Demo summary 3   
        </font>
    </div>
    <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
        <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
    </div>
</div>
</div>
<!--ends-->



</div>
<!--Tab 3-->
<div class="tab clearfix" id="tab3">
    <div class="Tab-page-thumb">
        <img src="${pageContext.request.contextPath}/resources/images/core/banner3.jpg"  width="270" height="503" />
    </div>
    <ul class="Tabpage-items">

        <!--start-->
        <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
            <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
                <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i41 ?>" 
                   class="Title">
                   Demo text
               </a>
           </div>
           <br/>
           <div style="width: 475; height: 120px; max-height: 120px;">
            <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
                <font face="verdana" color="grey" >
                    Demo text  
                </font>
            </div>
            <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
                <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
            </div>
        </div>
    </div>
    <!--ends-->

    <!--start-->
    <div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
        <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
            <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i42 ?>" 
               class="Title">
               Demo text
           </a>
       </div>
       <br/>
       <div style="width: 475; height: 120px; max-height: 120px;">
        <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
            <font face="verdana" color="grey" >
                Demo text 
            </font>
        </div>
        <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
            <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
        </div>
    </div>
</div>
<!--ends-->

<!--start-->
<div style="width: 475; max-width: 475; height: 160; max-height: 160;  display: inline-block; overflow: hidden; margin-top: 0px; margin-bottom: 12px ;">
    <div style="width: 475;  max-height: 40px; padding-bottom: 5px;  display: inline-block; overflow: hidden;">
        <a style="font-size: 18px; te" href="content/viewArticle.php?id=<?php echo $i43 ?>" 
           class="Title">
           Demo text
       </a>
   </div>
   <br/>
   <div style="width: 475; height: 120px; max-height: 120px;">
    <div style="float: right ; text-align:justify; width: 345px; padding-left: 10px;  display: inline-block; overflow: hidden; ">
        <font face="verdana" color="grey" >
            Demo text  
        </font>
    </div>
    <div style="width: 120; height: 120px; max-height: 120px; float: left"> 
        <img width="120px" height="120px" class="imageborder"  src="${pageContext.request.contextPath}/resources/images/core/thum.jpg"/>
    </div>
</div>
</div>
<!--ends-->
</ul>
</div>
<div>
    <img src="${pageContext.request.contextPath}/resources/images/core/Tabpage-shadow.jpg" width="780" height="9" />
</div>
</div>
</div>
<!-- Script chạy chuyển tab - gọi từ Yetii -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/yetii.js"></script>
<script type="text/javascript">if ($('#Tab-container').length) {
    var tabber1 = new Yetii({id: 'Tab-container', persist: false});
}
</script>