<#macro main title>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${title}</title>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="/css/styles.css">
        <script src="http://code.jquery.com/jquery-3.4.0.min.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.js" defer></script>
        <script src="/scripts/scripts.js" defer></script>

    </head>
    <header class="ui menu">
        <div class="ui container">
            <div class="item">
                <img class="ui small middle aligned image" src="/images/logo.png">
            </div>
            <a class="item" href="../clients/list">
                Clients
            </a>
            <a class="item" href="../flights/search">
                Flights
            </a>
            <div class="right menu">
                <a class="item">Sign Out</a>
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