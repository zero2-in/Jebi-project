<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제비 - 배송대행</title>
</head>
<body>
    <form action="${url}" method="post" name="urldirect">
        <input type="hidden" name="separate" value="${separate}">
        <input type="hidden" name="no" value="${no}">
    </form>
    <script>
        alert("${msg}");
        urldirect.submit();
    </script>
</body>
</html>