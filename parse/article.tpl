<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{{title}}</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/markdown.css" />
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?">
</head>
<body>
<div class="main-body">
    <div class="left-content" id="markDownContent">
		<div class="mdBlock">
			{{content}}
		</div>
    </div>
    <div class="right-nav nav-box">
        <ul class="nav">
			<li><a title="主页导航" href="/index.html">Home</a></li>
            <li><a title="PHP之CLI模式下的执行流程" href="/article/php/cli.html">php cli execute</a></li>
            <li><a title="PHP扩展开发之基础环境及工具介绍" href="/article/php/extension.html">php extension</a></li>
			<li><a title="PHP扩展开发之配置解析" href="/article/php/extension-ini.html">php extension 2</a></li>
			<li><a title="PHP扩展开发之函数与类的实现" href="/article/php/extension-function.html">php extension 3</a></li>
			<li><a title="PHP之编译流程分析" href="/article/php/compile.html">php compile</a></li>
			<li><a title="PHP之PHPNG简介" href="/article/php/php7-intro.html">phpng introduction</a></li>
			<li><a title="PHP之PHPNG实现细节" href="/article/php/php7-vm.html">phpng vm</a></li>
			<li><a title="PHP之把扩展从PHP5升级到PHPNG" href="/article/php/extension-php5to7.html">php5 to phpng</a></li>
			<li><a title="PHP之private修饰符" href="/article/php/php-private.html">php private</a></li>
			<li><a title="xhprof之简介与环境搭建" href="/article/xhprof/intro.html">xhprof intro</a></li>
			<li><a title="xhprof之扩展实现细节" href="/article/xhprof/theory.html">xhprof theory</a></li>
			<li><a title="linux之shell简介" href="/article/linux/shell.html">linux shell</a></li>
			<li><a title="数据结构之最小堆的基本操作" href="/article/data_structure/heap.html">min heap operation</a></li>
			<li><a title="数据结构之二叉搜索树" href="/article/data_structure/binary_search.html">binary search</a></li>
			<li><a title="数据结构之AVL平衡树" href="/article/data_structure/avl.html">avl</a></li>
			<li><a title="数据结构之散列表总结" href="/article/data_structure/hash.html">hash table</a></li>
			<li><a title="MYSQL之索引优化" href="/article/mysql/index.html">mysql index optimize</a></li>
        </ul>
		<div class="back-to-top"></div>
    </div>
</div>
<script type="text/javascript">
	$.nav_high_light = function(obj,on,hlClass){
		hlClass = hlClass || "hover";
		$(".nav li a").removeClass(hlClass);
		if(on){
			$(obj).addClass(hlClass);
		}else{
			var url = $(".mdBlock:visible").attr("data-href");
			$(".nav li a[href='"+url+"']").addClass(hlClass);
		}		
	}
	$.nav_high_light.timeOutHandle = null;
	$(document).ready(function(){
		$(".nav li a").click(function(){
			$.nav_high_light(this,true,"hover");
		}).hover(function(){
			$.nav_high_light(this,true,"hover");
		},function(){
			if($.nav_high_light.timeOutHandle)
				clearTimeout($.nav_high_light.timeOutHandle);
			$.nav_high_light.timeOutHandle = setTimeout(function(){
				$.nav_high_light(this,false,"hover");
			},1000);
		});

		$(".back-to-top").css({
			position : "fixed",
			left : $("#markDownContent").offset().left + $("#markDownContent").width() + 10,
			bottom : "10px"
		}).click(function(){
			$("html,body").stop().animate( { scrollTop: 0}, 200);
		});
		$(window).bind('scroll resize',function(){
			if($("body").scrollTop()>=$(window).height()){
				$(".back-to-top").show();
			}else{
				$(".back-to-top").hide();
			}
		});
		//index-hidden-begin
		$('.mdBlock>ol li').click(function(){
			var index = $(".mdBlock>ol li").index($(this)[0]),
					$title = $(this).parents(".mdBlock").find("h3,h4,h5").eq(index);
			if($title.length>0){
				$("html,body").stop().animate( { scrollTop: $title.offset().top}, 200);
			}
			return false;
		});
		//index-hidden-end
		var $nav = $(".nav");
		$nav.height($("#markDownContent").height() - parseInt($nav.css("margin-top")) - parseInt($nav.css("margin-bottom")));
	});

</script>
</body>
</html>
