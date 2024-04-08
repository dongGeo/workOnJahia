 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->
  <%@ page language="java" contentType="text/html;charset=UTF-8" %>
  <%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
  <%--@elvariable id="out" type="java.io.PrintWriter"--%>
  <%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
  <%--@elvariable id="scriptInfo" type="java.lang.String"--%>
  <%--@elvariable id="workspace" type="java.lang.String"--%>
  <%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
  <%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
  <%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
  
  <c:set var="siteNode" value="${renderContext.site}"/>
  
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>EPRS - Home</title>  
    
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>
    
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <meta http-equiv="cache-control" content="must-revalidate" />
    
    <!-- Favicon -->
    <c:choose>
      <c:when test="${jcr:isNodeType(renderContext.site, 'eprsmix:favicon')}">
        <template:module path="${renderContext.site.path}" view="favicon" />
      </c:when>
      <c:otherwise>
        <link rel="shortcut icon" href="${url.context}${url.currentModule}/img/favicon/favicon.ico" type="image/x-icon">
      </c:otherwise>
    </c:choose>
    
    <!-- Web Fonts -->
    <%-- Using local web fonts versus the google resource. If you want to change to google please uncomment this and comment out the local open-sans-webfonts.css
         <link rel='stylesheet' type='text/css'
         href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>         
         <template:addResources type="css" resources="open-sans-webfonts.css"/> --%>  
    
    <template:addResources type="javascript" resources="index.js" /> 
    <template:addResources type="css" resources="reset.css" />
    <template:addResources type="css" resources="main.css" />   
    
    <!-- JS Global Compulsory -->
    <template:addResources type="javascript" resources="jquery.min.js"/>
    
    <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
          />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11.0.5/swiper-bundle.min.js"></script>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    
  </head>
  <body>
    
    <div class="background" aria-hidden="true">
     <%-- <template:area path="background"/>--%>
      
      <figure>      
            <c:choose>
              <%-- check to see if the site has site logo specified, if not then use the logo area as defined in the template definition--%>
              <c:when test="${jcr:isNodeType(siteNode, 'eprsmix:background')}">
                    <template:module node="${siteNode}" view="default" nodeTypes="eprsmix:background" editable="true"/> 
              </c:when>
              <c:otherwise> 
                  <img id="backgroundImage1" alt="" src="${url.context}${url.currentModule}/images/backgroung/2.png" class="">
                  <img id="backgroundImage2" alt="" src="${url.context}${url.currentModule}/images/backgroung/2.png" class="show">
              </c:otherwise>
            </c:choose>
         <div class="background__gradient-overlay"></div>
      </figure>
    </div>  
    
    <header>
      <section class="header-section" role="toolbar">
        <div class="header-section__base">
          
          <div class="header-section__color-mode">            
            <button tabindex="0" type="button" aria-label="Toggle Color Mode" id="colorModeToggle" class="square-button">
              <i id="colorModeIcon" class="ph ph-sun"></i>
              <span class="button_description">Dark Mode</span>
              <span class="sr-only">Toggle Color Mode</span>
            </button> 
          </div>
               <c:if test="${jcr:isNodeType(siteNode, 'eprsmix:siteLogo')}">
                 <div class="header-section__logo">
                    <template:module node="${siteNode}" view="default" nodeTypes="eprsmix:siteLogo" editable="true"/> 
                </div>
          </c:if>
          <template:area path="header-section"/> 
           </div>
        
      </section>
      
      <nav class="hot-topics-nav" role="navigation" id="navigation">
        <div class="hot-topics-nav__background">
          <figure></figure>
        </div>        
        <template:area path="nav-menu"/> 
      </nav>
    </header>
    <main class="homepage"><%-- class variable --%>
      <template:area path="pageTitle"/>
      
      <template:area path="search-section"/> <%-- Show on page home pagetemplate --%>
      
      <template:area path="pagecontent"/>
      
      
      <template:area path="aside-visible"/><%-- Show on page article pagetemplate --%>
      <template:area path="aside-burger"/>  <%-- Show on page article pagetemplate --%>      
    </main>
    <footer>
      <template:area path="footer"/> 
    </footer>
	<c:if test="${renderContext.editMode}">
	    <template:addResources type="css" resources="edit.css" />
	</c:if>
	<template:addResources type="css" resources="960.css,01web.css"/>
	<template:theme/>
 
</body>
</html>
