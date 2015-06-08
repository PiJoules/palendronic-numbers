<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
    <head>
        <title>Making numbers palindromic</title>

        <link type="text/css" rel="stylesheet" href="/static/css/main.css"/>
    </head>

    <body>
        <p>
            <a target="_blank" href="https://www.reddit.com/r/dailyprogrammer/comments/38yy9s/20150608_challenge_218_easy_making_numbers/">https://www.reddit.com/r/dailyprogrammer/comments/38yy9s/20150608_challenge_218_easy_making_numbers/</a>
        </p>

        <form class="palindromic-numbers-form" method="GET" action="/check">
            <label>num: </label>
            <input type="text" name="num" value="" placeholder="num" />
            <br>
            <input type="submit" name="Update" value="Update" />
        </form>

        <p class="result"></p>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).on('submit', '.palindromic-numbers-form', function(e) {
                 $.ajax({
                    url: $(this).attr('action'),
                    type: $(this).attr('method'),
                    data: $(this).serialize(),
                    success: function(response) {
                        $(".result").text(response);
                    }
                });
                e.preventDefault();
            });
        </script>
    </body>
</html>