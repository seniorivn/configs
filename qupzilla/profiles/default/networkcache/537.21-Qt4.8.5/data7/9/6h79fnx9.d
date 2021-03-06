   �      8http://habrahabr.ru/styles/1380211759/_parts/_to_top.css %|M8��  %{� ��         
     O K           �      Server   nginx   Content-Type   text/css   Last-Modified   Fri, 02 Aug 2013 09:19:51 GMT   Expires   Wed, 25 Dec 2013 16:09:19 GMT   Cache-Control   )max-age=7776000, public, proxy-revalidate   Content-Encoding   gzip /* To top panel */

.to_top{display: none;}
.to_top .to_top_panel{display:none;}

/* Large desktop */
@media (min-width: 1050px) { 
	.to_top {
	  position: fixed;
	  top: 0;
	  bottom: 0;
	  left: 0;
	  width:40px;
	  -moz-opacity: 0.3;
	  filter: alpha(opacity=30);
	  opacity: 0.3;
	  display: none; 
	}
	
	.to_top .to_top_panel {
		display: block;
	  width:100%;
	  height: 100%;
	  font-size: 11px;
	  color: #4d7285;
	  padding-top: 10px; 
	  position: relative;
	}
	.to_top:hover {
	  -moz-opacity: 0.9;
	  filter: alpha(opacity=90);
	  opacity: 0.9; 
	}
	.to_top:hover .to_top_panel {
	  cursor: pointer;
	  background: #f0f0f0; 
	}
	.to_top .close_panel {
		position: absolute;
		bottom: 20px;
		left: 0px;
		right: 0px;
		text-align: center;
	  line-height: 8px;
	  font-family: tahoma, arial, verdana, sans-serif; 
	  display: none;
	}
	
	.to_top:hover .close_panel{
		display: block;
	}
	.to_top .to_top_button {
	  text-align: left;
	  line-height: 8px;
	  margin-left:10px;
	  font-family: tahoma, arial, verdana, sans-serif;
	  font-weight: bold; 
	}	
	.to_top .to_top_button .arrow{
		font-size: 14px;
		font-weight: bold; 
		font-family: tahoma;
		vertical-align: middle;
	}

	
	/* стиль для mini панели */
	.to_top .to_top_panel .arrow{font-size:20px;}
	.to_top .to_top_panel .label{display:none;}
}
