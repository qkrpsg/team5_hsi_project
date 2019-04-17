<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        관리자 페이지
        <small>명소 찾기 </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid" style="overflow:hidden" >

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
      <div  class="box-body_wrap col-md-6" >
        <div class="box-body"  >
          <img class="img-responsive pad" src="<c:url value='/resources/images/13.jpg'/>" alt="Photo" >

          <p></p>
          <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 보기</button>
          <button type="button" class="btn btn-default btn-xs"><i class="fa  fa-trash-o"></i> 삭제</button>
          <!--<span class="pull-right text-muted">...</span>-->
        </div>

        <!-- /.box-body -->
        <div class="box-footer box-comments">
          <div class="box-comment">
            <!-- User image -->
            <img class="img-circle img-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>"  alt="User Image">

            <div class="comment-text" >
                  <span class="username">
                   id:를 넣어주세요 Maria Gonzales
                    <span class="text-muted pull-right">작성일 ㅇㅇㅇ</span>
                  </span><!-- /.username -->
                  상세 글을 넣어주세요
              It is a long established fact that a reader will be distracted
              by the readable content of a page when looking at its layout.
            </div>
            <!-- /.comment-text -->
          </div>
        </div>
      </div>




      <div  class="box-body_wrap col-md-6" >
          <div class="box-body"  >
            <img class="img-responsive pad" src="<c:url value='/resources/images/5.jpg'/>" alt="Photo" >
  
            <p></p>
            <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 보기</button>
            <button type="button" class="btn btn-default btn-xs"><i class="fa  fa-trash-o"></i> 삭제</button>
            <!--<span class="pull-right text-muted">...</span>-->
          </div>
  
          <!-- /.box-body -->
          <div class="box-footer box-comments">
            <div class="box-comment">
              <!-- User image -->
              <img class="img-circle img-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>"  alt="User Image">
  
              <div class="comment-text" >
                    <span class="username">
                     id:를 넣어주세요 Maria Gonzales
                      <span class="text-muted pull-right">작성일 ㅇㅇㅇ</span>
                    </span><!-- /.username -->
                    상세 글을 넣어주세요
                It is a long established fact that a reader will be distracted
                by the readable content of a page when looking at its layout.
              </div>
              <!-- /.comment-text -->
            </div>
          </div>
        </div>
  
        <div  class="box-body_wrap col-md-6" >
            <div class="box-body"  >
              <img class="img-responsive pad" src="<c:url value='/resources/images/9.jpg'/>" alt="Photo" >
    
              <p></p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 보기</button>
              <button type="button" class="btn btn-default btn-xs"><i class="fa  fa-trash-o"></i> 삭제</button>
              <!--<span class="pull-right text-muted">...</span>-->
            </div>
    
            <!-- /.box-body -->
            <div class="box-footer box-comments">
              <div class="box-comment">
                <!-- User image -->
                <img class="img-circle img-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>"  alt="User Image">
    
                <div class="comment-text" >
                      <span class="username">
                       id:를 넣어주세요 Maria Gonzales
                        <span class="text-muted pull-right">작성일 ㅇㅇㅇ</span>
                      </span><!-- /.username -->
                      상세 글을 넣어주세요
                  It is a long established fact that a reader will be distracted
                  by the readable content of a page when looking at its layout.
                </div>
                <!-- /.comment-text -->
              </div>
            </div>
          </div>



          <div  class="box-body_wrap col-md-6" >
              <div class="box-body"  >
                <img class="img-responsive pad" src="<c:url value='/resources/images/12.jpg'/>" alt="Photo" >
      
                <p></p>
                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i> 보기</button>
                <button type="button" class="btn btn-default btn-xs"><i class="fa  fa-trash-o"></i> 삭제</button>
                <!--<span class="pull-right text-muted">...</span>-->
              </div>
      
              <!-- /.box-body -->
              <div class="box-footer box-comments">
                <div class="box-comment">
                  <!-- User image -->
                  <img class="img-circle img-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>"  alt="User Image">
      
                  <div class="comment-text" >
                        <span class="username">
                         id:를 넣어주세요 Maria Gonzales
                          <span class="text-muted pull-right">작성일 ㅇㅇㅇ</span>
                        </span><!-- /.username -->
                        상세 글을 넣어주세요
                    It is a long established fact that a reader will be distracted
                    by the readable content of a page when looking at its layout.
                  </div>
                  <!-- /.comment-text -->
                </div>
              </div>
            </div>
      

<div style="clear:both;">
<!-- 페이징 -->
<div class="row" style="margin-top:30px;margin-bottom: 30px;">
  <!-- 페이지네이션 가운데 배치:text-center -->
  <div class="col-md-12 text-center">${pagingString}</div>
</div>
<!-- 검색용 UI -->
<div class="row">
  <div class="text-center">
    <form class="form-inline" method="post"
      action="<c:url value='/OneMemo/Memo/List.bbs'/>">
      <div class="form-group">
        <select name="searchColumn" class="form-control">
          <option value="title">제목</option>
          <option value="name">작성자</option>
          <option value="content">내용</option>
        </select>
      </div>
      <div class="form-group">
        <input type="text" name="searchWord" class="form-control" />
      </div>
      <button type="submit" class="btn btn-primary">검색</button>

    </form>
  </div>
</div>
</div>



    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->