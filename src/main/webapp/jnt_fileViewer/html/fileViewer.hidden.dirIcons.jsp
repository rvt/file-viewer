<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="subchild" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:include view="hidden.settings"/>

<ul id="select${currentNode.UUID}" class="directorySelection">
    <c:if test="${moduleMap.renderPath eq true}">
        <c:forEach items="${moduleMap.targetNode.nodes}" var="subchild">
            <c:if test="${jcr:isNodeType(subchild, 'jnt:folder')}">
                <li>
                    <a href="${moduleMap.thisUrl}?${moduleMap.params}&${moduleMap.folder}=${subchild.name}">
                        <c:if test="${not empty subchild.properties.folderIcon}">
                            <img src="<c:url value="${subchild.properties.folderIcon.node.url}"/>"/>
                        </c:if>
                        <c:if test="${empty subchild.properties.folderIcon}">
                            <c:set var="selected" value=""/>
                            <c:if test="${subchild.name ne moduleMap.selectedValue}">
                                <c:set var="selected" value="_closed"/>
                            </c:if>
                            <img src="${url.currentModule}/img/folder${selected}.png"/>
                        </c:if>
                        <br/>
                        <span>${subchild.name}</span>
                    </a>
                </li>
            </c:if>
        </c:forEach>
    </c:if>
</ul>

