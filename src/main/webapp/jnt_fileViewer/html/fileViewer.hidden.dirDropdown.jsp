<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="uiComponents" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="subchild" type="org.jahia.services.content.JCRNodeWrapper"--%>



<template:include view="hidden.settings" />


<select id="select${currentNode.UUID}">
    <option value="">${currentNode.properties.selectLabel.string}</option>
    <c:if test="${moduleMap.renderPath eq true}">
        <c:forEach items="${moduleMap.targetNode.nodes}" var="subchild">
            <c:if test="${jcr:isNodeType(subchild, 'jnt:folder')}">
                <c:set var="selected" value="" />
                <c:if test="${subchild.name eq moduleMap.selectedValue}">
                    <c:set var="selected" value=" selected" />
                </c:if>
                    <option value="${subchild.name}" ${selected}>${subchild.name}</option>
            </c:if>
        </c:forEach>
    </c:if>
</select>


<template:addResources type="inline">
    <script type="text/javascript">
        jQuery(document).ready(
                function() {

                    $("#select${currentNode.UUID}").change(function(){
                        window.location='${moduleMap.thisUrl}?${moduleMap.params}&${moduleMap.folder}=' + this.value;
                    });
                }
        );
    </script>
</template:addResources>
