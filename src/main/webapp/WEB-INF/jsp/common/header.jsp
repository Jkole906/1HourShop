<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kolectibles</title>
    <c:url value="/css/toyStore.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}">
</head>

<body>
    <header>
    		<c:url value="/" var="homePageHref" />
    		<c:url value="/img/logo.png" var="logoSrc" />
        <a href="${homePageHref}">
        		<img src="${logoSrc}" alt="Solar System Geek logo" />
        </a>
        <h1>Kolectibles Toy Store</h1>
        <p> </p>
    </header>
    <nav>
        <h2>Figures for sale!</h2>
        <p> </p>
        <ul>
        		<c:url value="/category/2" var="marvelItemsList" />
            <li><a href="${marvelItemsList}">Marvel Items</a></li>
            <c:url value="/category/1" var="starWarsItemsList" />
            <li><a href="${starWarsItemsList}">Star Wars Items</a></li>
            <c:url value="/category/3" var="dcItemsList" />
            <li><a href="${dcItemsList}">DC Items</a></li>
<%--             <c:url value="forumOutputPage" var="forum" />
            <li><a href="${forum }">Space Forum</a></li>   
            <c:url value="store" var="store" />
            <li><a href="${store}">Space Store</a></li>     --%>         
        </ul>
    </nav>