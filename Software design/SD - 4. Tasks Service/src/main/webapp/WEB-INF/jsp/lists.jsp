<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <c:set var="listsPresent" value="${listsOfTasks != null && not empty listsOfTasks}" />
    
    <head>
        <meta charset="UTF-8" />
        <title>Tasks page</title>
        
        <link rel="stylesheet" href="/resources/css/lists.css" />
        <link rel="shortcut icon" href="/resources/gfx/jiraf.png" type="image/x-icon">
    </head>
    
    <body>
        <header id="main-header" onclick="location.href='/'">
            <span>JiraF</span><img src="/resources/gfx/jiraf.png" />
        </header>
        
        <div id="control-container">
            <button id="add-list-button">
                <img src="/resources/gfx/add.png" /> <span>task list</span>
            </button>
        </div>

        <c:if test="${listsPresent}">
            <div id="lists-container">
                <c:forEach var="list" items="${listsOfTasks}">
                    <div>
                        <header>${list.getHeader ()}</header>
                        
                        <div class="list-control-container">
	                        <button list="${list.getID ()}" 
	                                title="${list.getHeader ()}" 
	                                class="add-task-button">
	                           <img src="/resources/gfx/add.png" />
	                        </button>
	                        <button list="${list.getID ()}"
	                                class="delete-list-button">
	                           <img src="/resources/gfx/bin.png" />
	                        </button>
	                    </div>
	                    
	                    <c:set var="tasks" value="${list.getTasks ()}" />
	                    
	                    <c:choose>
	                       <c:when test="${tasks != null && not empty tasks}">
	                           <ul>
	                               <c:forEach var="task" items="${tasks}">
	                                   <c:set var="styleClass" value="${task.getStatus ().getStyle ()}" />
	                                   <c:set var="status" value="${task.getStatus ().toString ()}" />
                                       
	                                   <li task="${task.getID ()}"
	                                       class="task ${styleClass}">
	                                       <span>${task.getDescription ()}</span>
	                                       <c:if test="${task.hasExpireDate ()}">
	                                           <span><b>Till:</b> ${task.getExpireDate ()}</span>
	                                       </c:if>
	                                       <span><b>Status:</b> ${status}</span>
	                                       <button class="delete-task-button">
	                                           <img src="/resources/gfx/bin.png" />
	                                       </button>
	                                   </li>
	                               </c:forEach>
	                           </ul>
	                       </c:when>
	                       
	                       <c:otherwise>
	                           <div class="no-tasks-message">Soon here will be something...</div>
	                       </c:otherwise>
	                    </c:choose>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${!listsPresent}">
            <p id="no-lists-message">
                No task lists available... try to <b>add</b> new one
            </p>
        </c:if>
        
        <div id="add-list-shadow" class="shadow ma">
            <div>
                <header>Add new list</header>
                <div>Title: 
                    <input id="add-list-title" type="text" />
                </div>
                <div>
                    <span id="add-list-error"></span>
                    <button id="add-list-button-final">add list</button>
                </div>
            </div>
        </div>
        
        <div id="add-task-shadow" class="shadow">
            <div>
                <header>Add new task</header>
                <div>Description: 
                    <input id="add-task-desc" type="text" />
                </div>
                <div>Expire date: 
                    <div>
                        <input id="add-task-date" type="date" /> 
                        <input id="add-task-time" type="time" />
                    </div>
                </div>
                <div>List: 
                    <div id="add-task-label"></div>
                    <input id="add-task-list" type="hidden" value="" />
                </div>
                <div>
                    <span id="add-task-error"></span>
                    <button id="add-task-button">add task</button>
                </div>
            </div>
        </div>
        
        <script type="text/javascript" src="/resources/js/index.js"></script>
    </body>
</html>