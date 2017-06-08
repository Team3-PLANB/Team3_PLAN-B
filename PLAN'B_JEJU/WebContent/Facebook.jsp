<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

  <head>

    <title>facebook login API Test</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- <link href="/css/bootstrap.css" rel="stylesheet" media="screen">

    <link href="/css/common.css" rel="stylesheet" media="screen">

    <link href="/css/highlight.min.css" rel="stylesheet" media="screen">

    <link href="/css/monokai_sublime.css" rel="stylesheet" media="screen"> -->



    <!--[if lt IE 9]>


      <script src="/js/html5shiv.js"></script>


      <script src="/js/respond.min.js"></script>


      <script src="/js/json2.js"></script>      


    <![endif]-->

    <!-- <script src="/js/jquery-1.11.1.min.js" type="text/javascript"></script>

    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>

    <script src="/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="/js/jquery.form.js" type="text/javascript"></script>

    <script src="/js/highlight.min.js" type="text/javascript"></script> -->

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

    <script type="text/javascript">


    $(document).ready(function() {


      $('div.codeReview code').each(function(i, block) {


       /*  hljs.highlightBlock(block); */


      });


      window.fbAsyncInit = function() {


        FB.init({


          appId      : '1411879235558357',  // 앱 ID


          status     : true,          // 로그인 상태를 확인


          cookie     : true,          // 쿠키허용


          xfbml      : true           // parse XFBML


        });


        FB.getLoginStatus(function(response) {


            if (response.status === 'connected') {


                FB.api('/me', function(fbUser) {


                  if(fbUser)


                  {


                    $('#image').attr('src','http://graph.facebook.com/' + fbUser.id + '/picture');


                    $('#name').html(fbUser.name);


                    $('#locale').html(fbUser.locale);


                    $('#link').html("<a href='"+fbUser.link+"'>"+fbUser.id+"</a>");


                    $('#response').html( '<pre>' + JSON.stringify(response) + '</pre>' );


                    $('#meResponse').html( '<pre>' + JSON.stringify(fbUser) + '</pre>' );


                  }


                });



            } else if (response.status === 'not_authorized') {





            } else {


                


            }


        });





        FB.Event.subscribe('auth.login', function(response) {


            document.location.reload();


        });


      };


    


      // Load the SDK Asynchronously


      (function(d){


         var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];


         if (d.getElementById(id)) {return;}


         js = d.createElement('script'); js.id = id; js.async = true;


         js.src = "//connect.facebook.net/ko_KR/all.js";


         ref.parentNode.insertBefore(js, ref);


       }(document));


    });


    </script>

  </head>

  <body>

    <div class="container">

      <h3>페이스북 버튼 출력 </h3>

      <div


        class="fb-like"


        data-share="true"


        data-width="450"


        data-show-faces="true">

      </div>



      <div id="fb-root"></div>



      <fb:login-button show-faces="false" width="200" max-rows="1"></fb:login-button>



      <hr/>

      

      <h3>사용자정보 출력</h3>

      <div align="left">

          <h4>페이스북 로그인 검사</h4>

          <div id="response"></div>



          <h4>페이스북 response Data</h4>

          <div id="meResponse"></div>



          <h4>페이스북 연동정보</h4>

          <img id="image"/>

          <div id="name"></div>

          <div id="locale"></div>

          <div id="link"></div>

      </div>

    </div>



    <div class="codeReview"><code></code></div>

  </body>

 </html>