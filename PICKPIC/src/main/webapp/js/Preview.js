/* <!-- 프리뷰에 다중으로 이미지띄우기  --> */
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var downloadBtn = document.getElementById("download-btn");
var uploadMypc = document.getElementById("upload-mypc");
var revertBtn = document.getElementById("revert");


/* 필터 선택시 이미지에 필터 적용*/
function filterOn(item) {
	console.log("item: "+item);
	if (item.classList.contains("revert-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	    	  this.revert();	    	  
	      });
	    } 
	else if (item.classList.contains("lomo-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	        this.lomo().render();
	      });
	    } 
	else if (item.classList.contains("vintage-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	        this.vintage().render();
	      });
	    }

}

var fileCollection = new Array();
var index = 0;
var idArray = new Array();

$('#upload-mypc').on('change',
				function(e) {
					var files = e.target.files;
					loadcount = 0;
				    loadtotal = files.length;
				    preloaded = false;
					$.each(files,
							function(i, file) {
										fileCollection.push(file);
										var reader = new FileReader();
										reader.readAsDataURL(file);
										reader.onload = function(e) {
											console.log(e);
											console.log(e.target.result);
											var template = '<div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_'+index+'">'
											+'<div class=" photo_wrap" id="photo_wrap_'+index+'">'
											+'<div class="photo">'
											+'<div class="photo_center_wrap">'
											+'<div class="photo_center" id=set_index+>'
											+'<canvas id="canvas" onload="loadImage('+e+')"></canvas>'
											+'</div></div></div>'
											+'<div class="menu" style="border-top: 1px solid #e6e6e6;">'
											+'<div class="centered">'
											+'<div class="btn-group item" role="group">'
											+'<button type="button" class="btn btn-default dl_btn" id="'+index+'" onclick="javascript:deleteItem(this)">삭제</button>'
											+'<button type="button" class="btn btn-default tg_btn" id="'+index+'" onclick="javascript:selectItem(this)">선택</button>'
											+'</div></div></div></div></div>';
											
											
											function lodeImage(e) {
												console.log("55555");
												var image =  new Image ( ) ;
												image.src = e.target.result;
												image.onload = function() {
											        canvas.width = img.width;
											        canvas.height = img.height;
											        ctx.drawImage(img, 0, 0, image.width, image.height);
											        canvas.removeAttribute("data-caman-id");
											      };
											};
											
											idArray[idArray.length] = index;
											index++;
											
											$('#preview').append(template);
											
											console.log(e.target.result);
											$('#imgCount').html('0 / ' + idArray.length);

										};

									});
					console.log(idArray);

				});