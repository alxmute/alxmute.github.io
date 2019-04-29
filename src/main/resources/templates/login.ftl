<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.css">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
    <script src="http://code.jquery.com/jquery-3.4.0.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.js" defer></script>
    <#--<script src="/scripts/script.js" defer></script>-->

</head>
<body>

<div class="ui middle aligned center aligned grid login-form-grid">
    <div class="column">
        <h2 class="ui primary image header">
            <img src="/images/loginLogo.png" class="image">
            <div class="content">
                Log-in to your account
            </div>
        </h2>
        <form action="/login" method="post" class="ui large form">

            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="username" placeholder="Username">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="Password">
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="ui fluid large primary submit button">Login</button>
            </div>

            <#if RequestParameters.error??>
                <div class="ui negative message">
                    <p>Invalid username and password.</p>
                </div>
            </#if>
            <#if RequestParameters.logout??>
                <div class="ui positive message">
                    <p>You have been logout.</p>
                </div>
            </#if>

        </form>
    </div>
</div>

</body>
</html>