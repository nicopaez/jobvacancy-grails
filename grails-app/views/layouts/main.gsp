<!DOCTYPE html>
<html lang="en-US">
	<head>
    <meta charset="utf-8">
		<title>Job Vacancy Board - find the best jobs</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
		<div class="container">
      <div class="masthead">
      	<div class="container">
      	<div class="app-title">
      	<h1>Job Vacancy Board</h1>
      	</div>
      	<div class="profile"> 
				</div>
				</div>
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">
                <li><a href="#">Home</a></li>
                <li><a href="#">Job Offers</a></li>
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>

      <div class="container">
			  <div>
				<!--  messages here -->
			  </div>

		<g:layoutBody/>
		<div class="footer">
      	<hr/>
        <p>Job Vacancy Board by NicoPaez | 2014</p>
      	</div>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

      </div>
      <!-- footer -->

    </div> 

		</body>
</html>

