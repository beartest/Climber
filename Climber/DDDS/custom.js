$(function(){
	// 以下不是效果演示部分，请跳过！
	$("#intro").KandyTabs({
		trigger:"click",
		action:"slide",
		except:".tip",
		child:["dl.feature",{action:"fade"}],
		current:6,
		process:true,
		nav:true,
		done:function(){$(".changelog").wrapInner("<div/>")}
	});
	
	$(".changelog div").KandyTabs({
		classes:"kandyFold",
		type:"fold",
		trigger:"click",
		action:"slide",
		current:2
	});
	$("a.see-defect").click(function(){
		$("#defect").trigger("mouseover");
		$(".nest").animate({paddingLeft:20},500).animate({paddingLeft:0},400).animate({paddingLeft:10},300).animate({paddingLeft:0},200).animate({paddingLeft:5},100).animate({paddingLeft:0},50);
		return false;
	});
	$("a.see-options").click(function(){
		$("#options").trigger("click");
		return false;
	});
	$("a.see-codestruct").click(function(){
		$("#codestruct").trigger("click");
		return false;
	});
	// 以上不是效果演示部分，请跳过！
	
	// Tab选项卡效果演示
	$("#simple").KandyTabs();
	
	$("#fade").KandyTabs({
		action:"fade",
		delay:1000
	});
	$("#slifade").KandyTabs({
		action:"slifade",
		delay:500
	});
	$("#slide").KandyTabs({
		action:"slide",
		trigger:"click"
	});
	$("#roll").KandyTabs({
		action:"roll",
		trigger:"mousedown"
	});
	$("#rollleft").KandyTabs({
		action:"roll",
		trigger:"mouseup",
		direct:"left",
		loop:true
	});
	// fold折叠效果演示
	$("#fold-simple").KandyTabs({
		classes:"kandyFold",
		type:"fold"
	});
	$("#fold-slide").KandyTabs({
		classes:"kandyFold",
		action:"slide",
		type:"fold"
	});
	$("#fold-fade").KandyTabs({
		classes:"kandyFold",
		action:"fade",
		type:"fold",
		trigger:"click"
	});
	
	$("#fold-left").KandyTabs({
		classes:"kandyFold",
		type:"fold",
		action:"fade",
		trigger:"click",
		last:800
	})
	$("#fold-right").KandyTabs({
		classes:"kandyFold",
		type:"fold",
		direct:"left",
		action:"slide",
		done:function(b,c,t){
			b.each(function(i){
				$(this).insertAfter(c[i])			
			})
			c.wrapInner("<div style='padding:10px'/>")
		}
	})
	// Slide幻灯片效果演示
	$("#imgslide").KandyTabs({
		classes:"kandySlide",
		action:"slifade",
		stall:5000,
		type:"slide",
		auto:true,
		process:true,
		direct:"left",
		resize:false
	});
	$("#imgnavslide").KandyTabs({
		classes:"kandySlide",
		action:"roll",
		stall:5000,
		type:"slide",
		auto:true,
		nav:true,
		direct:"left",
		lang:{
			prev:["点一下就显示前一张图片","&lt;"],
			next:["点一下就显示下一张图片","&gt;"],
			first:["",""],
			last:["",""]
		},
		resize:false
	});
	$("#customslide").KandyTabs({
		classes:"kandySlide",
		action:"roll",
		stall:5000,
		type:"slide",
		auto:true,
		custom:function(b,c,i){
				$("p",c).hide();
				c.eq(i).find("p").slideDown();
			  },
		done:function(b,c,t){
				$("p",c).fadeTo(500,.7).hide();
				c.first().find("p").slideDown();
			  }
	});
	// Loop多列循环（旋转木马）效果演示
	$("#imgloop").KandyTabs({
		type:"slide",
		column:3,
		classes:"kandyLoop",
		action:"roll",
		trigger:"click",
		except:"h4",
		auto:true,
		nav:true,
		resize:false
	});
	$("#imgscroll").KandyTabs({
		type:"slide",
		column:3,
		classes:"kandyLoop",
		action:"roll",
		direct:"left",
		trigger:"click",
		except:"h4",
		auto:true,
		nav:true,
		loop:true,
		resize:false
	});
	// Step/Guide步骤表单/向导效果演示
	$("#simplestep").KandyTabs({
		trigger:"step",
		classes:"kandyStep",
		nav:true,
		action:"slide",
		lang:{first:["",""],prev:["上一步","上一步"],next:["下一步","下一步"],last:["",""]},
		custom:function(b,c,i,t){
			b.eq(i).removeClass("tabok").prev().addClass("tabok").next().removeClass("tabok")
		}
	});
	$("#verifystep").KandyTabs({
		trigger:"step",
		classes:"kandyStep",
		nav:true,
		lang:{first:["",""],prev:["上一步","上一步"],next:["下一步","下一步"],last:["",""]},
		custom:function(b,c,i,t){
			i == 0 ? $(".tabprev",t).hide() : $(".tabprev",t).show()
			i == b.length-1 ? $(".tabnext",t).hide() : $(".tabnext",t).show()
			b.eq(i).removeClass("tabok").prev().addClass("tabok").next().removeClass("tabok")
			c.eq(i).find("input").keyup(function(){
				if (this.value != "") {
					$(".tabnext",t).removeClass("tabnextno")
					$(this).removeClass("err")
				} else {
					$(".tabnext",t).addClass("tabnextno")
					$(this).addClass("err")
				}
			})
			setTimeout(function(){c.eq(i).find("input").trigger("keyup")},1)
		},
		done:function(b,c,t){
			$("input",t).each(function(){
				this.value == "" ?  $(this).addClass("err") : $(this).removeClass("err")
			})
			b.first().trigger("step")
		}
	});
})