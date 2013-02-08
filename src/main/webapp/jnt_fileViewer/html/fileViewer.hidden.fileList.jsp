<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="subchild" type="org.jahia.services.content.JCRNodeWrapper"--%>


<template:include view="hidden.settings" />

<div id="fileList${currentNode.identifier}">
    <c:if test="${moduleMap.renderPath eq true}">
        <template:addResources type="css" resources="fileList.css"/>
        <ul class="filesList">
            <c:forEach items="${moduleMap.targetNode.nodes}" var="subchild">
                <c:if test="${jcr:isNodeType(subchild, 'jnt:file')}">
                    <li>
                        <template:module node="${subchild}" view="link" editable="false"/>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </c:if>
</div>


