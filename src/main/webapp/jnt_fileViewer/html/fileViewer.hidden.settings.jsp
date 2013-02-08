<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="subchild" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="level" value="${not empty currentNode.properties.level?currentNode.properties.level.long:0}" />
<c:set var="targetNodePath" value="${currentNode.properties.folder.node.path}"/>

<c:set var="params" value="" />
<c:set var="selectedPath" value="${targetNodePath}" />
<c:set var="renderPath" value="${level eq 0?true:false}"/>
<c:set var="selectedValue" value="" />
<c:forEach begin="0" end="10" var="count">
    <c:set var="folder" value="folder_${count}" />
    <c:if test="${not empty param[folder]}">
        <c:set var="selectedPath" value="${selectedPath}/${param[folder]}" />
        <c:if test="${count eq level-1}">
            <c:set var="renderPath" value="${true}" />
            <c:set var="targetNodePath" value="${selectedPath}"/>
        </c:if>
        <c:if test="${count lt level}">
            <c:set var="params" value="${params}&folder_${count}=${param[folder]}" />
        </c:if>
        <c:if test="${count eq level}">
            <c:set var="selectedValue" value="${param[folder]}" />
        </c:if>
    </c:if>
</c:forEach>


<template:addCacheDependency path="${targetNodePath}"/>
<c:url value="${url.base}${renderContext.mainResource.node.path}.html" var="thisUrl" />
<jcr:node var="targetNode" path="${targetNodePath}"/>

<%-- Settings that will get transferred and can be used as a moduleMap for other modules --%>
<c:set target="${moduleMap}" property="folder" value="folder_${level}" />
<c:set target="${moduleMap}" property="targetNode" value="${targetNode}" />
<c:set target="${moduleMap}" property="thisUrl" value="${thisUrl}" />
<c:set target="${moduleMap}" property="renderPath" value="${renderPath}" />
<c:set target="${moduleMap}" property="params" value="${params}" />
<c:set target="${moduleMap}" property="selectedValue" value="${selectedValue}" />
