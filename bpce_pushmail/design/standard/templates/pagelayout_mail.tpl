<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<META content="MSHTML 6.00.2900.3132" name=GENERATOR>
<style>
{literal}
 *
 {
    margin: 0;
	padding: 0;
 }
 img	{
	border: 0;
	margin:0;
	}

ul	{
	list-style: none;
	}

body {
	background:#E0E0E0;
	font-family:Arial, sans-serif;
	font-size:11px;
	color: #3b3b3b;
	text-align: center;
}

a {
	font-family:Arial, sans-serif;
	font-weight:bold;
	font-size:11px;
	text-decoration:none;
	 color: #F18B49;
}

a:hover {
	text-decoration:underline;
}

#fullheightcontainer{
  margin-left:auto;
  margin-right:auto;
  text-align:left;
  position:relative;
  width:600px;
  background:#FFFFFF;
  overflow: hidden;
}

#header{
  width:600px;
  border-bottom: #F18B49 3px solid;

}

#subheader1{
    height: 60px
}

#content{
  width:560px;
  margin-left:20px;
  margin-right:20px;
  padding-top: 20px;
  padding-bottom: 5px;
  float:left;
  display:inline;
  background-color:#FFFFFF;
  overflow: hidden;
  word-wrap: break-word;
}

#footer{
  clear: both;
  margin-left:auto;
  margin-right:auto;
  text-align:left;
  width:600px;
  background:#E0E0E0;
  padding-top:5px;
  padding-bottom:3px;
  overflow: hidden;
}

.bannertitle{
        font-family: arial;
        font-weight: bold;
        font-size: 22px;
        color: #F18B49;
        text-transform: uppercase;
}

.titremoyen{
        font-weight: bold;
        font-size: 16px;
        color: #F18B49;
        margin-top: 10px;
        margin-right: 10px;
        margin-bottom: 10px;
        margin-left: 0px;
}

.signature{
        margin-top:10px;
        text-align:right;
}
{/literal}
</style>
</HEAD>
<BODY>
{default top_logo="ezpublish_admin.gif"}
<DIV dir=ltr align=left>&nbsp;</DIV>
<DIV id="fullheightcontainer">
	<DIV id="header">
		<DIV id="subheader1">
		<img src={"logo.png"|ezimage()} alt="{ezini('SiteSettings','SiteName')}" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; MARGIN: 10px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" align="left" border="0"/>
		<TABLE>
			<TR>
			    <TD style="VERTICAL-ALIGN: middle" width=235 height=55><SPAN 				      class=bannertitle>{ezini('SiteSettings','SiteName')}</SPAN><BR/></TD>
			</TR>
		</TABLE>
	</DIV>
	</DIV>
	<DIV id="content" >
		{$module_result.content}
	</DIV>
	</DIV>
<DIV id="footer" >
Copyright 2009 SiteName
</DIV>
</BODY>
</HTML>