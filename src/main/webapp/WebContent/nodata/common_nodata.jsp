<%@ page pageEncoding="UTF-8" %>
<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("노데이터");
        $("#breadcrumbs .nodata").addClass("selected");
        $("#breadcrumbs .nodata").attr("href", "javascript:void(0)");
    });
</script>
