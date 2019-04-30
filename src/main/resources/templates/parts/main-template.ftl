<#include "../parts/security.ftl">
<#macro main title>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${title}</title>

        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.min.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.js" defer></script>
        <script src="/scripts/script.js" defer></script>
        <link rel="stylesheet" type="text/css" href="/css/styles.css">

    </head>
    <header class="ui stackable inverted menu blue-menu">
        <div class="ui container">
            <div class="item">
                <img class="ui small middle aligned image" src="/images/nmu-logo-white.png">
            </div>
            <a class="item" href="../clients/list">
                Clients
            </a>
            <a class="item" href="../flights/search">
                Flights
            </a>
            <a class="item" href="../tickets/list">
                Tickets
            </a>
            <#if isAdmin>
                <a class="item" href="../users/list">
                    Users
                </a>
            </#if>
            <div class="right menu">
                <div class="item link">
                    <form action="/logout" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="ui button transparent-button">Sign Out</button>
                    </form>
                </div>

            </div>
        </div>
    </header>

    <body>

    <div class="ui container">
        <@content/>
    </div>


    </body>
    </html>
</#macro>