<#include "../parts/security.ftl">
<#macro main title>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${title}</title>

        <link rel="shortcut icon" href="/images/loginLogo.png" type="image/png">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.min.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.7.4/dist/semantic.min.js" defer></script>
        <script src="/scripts/script.js" defer></script>
        <link rel="stylesheet" type="text/css" href="/css/styles.css">

    </head>

    <body>

    <header class="header">
        <div class="logo">
            <svg id="logo" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 806.75 271.86">
                <defs>
                    <style>
                        .cls-1, .cls-5 {
                            fill: #3294c8;
                        }

                        .cls-1, .cls-2, .cls-3 {
                            fill-rule: evenodd;
                        }

                        .cls-2, .cls-4 {
                            fill: #005e91;
                        }

                        .cls-3, .cls-6 {
                            fill: #003d5e;
                        }
                    </style>
                </defs>
                <path class="cls-1"
                      d="M155.67,0H192.1a16.57,16.57,0,0,1,16.56,16.58V51.39A16.56,16.56,0,0,1,192.1,68H155.67a16.56,16.56,0,0,1-16.56-16.57V16.58A16.57,16.57,0,0,1,155.67,0Z"/>
                <path class="cls-2"
                      d="M155.67,68H192.1a16.57,16.57,0,0,1,16.56,16.58v34.81a16.57,16.57,0,0,1-16.56,16.58H155.67a16.57,16.57,0,0,1-16.56-16.58V84.54A16.57,16.57,0,0,1,155.67,68Z"/>
                <path class="cls-1"
                      d="M86.11,68h36.44a16.58,16.58,0,0,1,16.56,16.58v34.81a16.57,16.57,0,0,1-16.56,16.58H86.11a16.57,16.57,0,0,1-16.56-16.58V84.54A16.58,16.58,0,0,1,86.11,68Z"/>
                <path class="cls-2"
                      d="M86.11,135.93h36.44a16.57,16.57,0,0,1,16.56,16.57v34.82a16.57,16.57,0,0,1-16.56,16.57H86.11a16.57,16.57,0,0,1-16.56-16.57V152.5A16.57,16.57,0,0,1,86.11,135.93Z"/>
                <path class="cls-3"
                      d="M155.67,135.93H192.1a16.56,16.56,0,0,1,16.56,16.57v34.82a16.56,16.56,0,0,1-16.56,16.57H155.67a16.56,16.56,0,0,1-16.56-16.57V152.5A16.56,16.56,0,0,1,155.67,135.93Z"/>
                <path class="cls-3"
                      d="M155.67,203.89H192.1a16.57,16.57,0,0,1,16.56,16.58v34.81a16.57,16.57,0,0,1-16.56,16.58H155.67a16.57,16.57,0,0,1-16.56-16.58V220.47A16.57,16.57,0,0,1,155.67,203.89Z"/>
                <path class="cls-3"
                      d="M86.11,203.89h36.44a16.57,16.57,0,0,1,16.56,16.58v34.81a16.58,16.58,0,0,1-16.56,16.58H86.11a16.58,16.58,0,0,1-16.56-16.58V220.47A16.57,16.57,0,0,1,86.11,203.89Z"/>
                <path class="cls-2"
                      d="M16.56,203.89H53a16.57,16.57,0,0,1,16.56,16.58v34.81A16.57,16.57,0,0,1,53,271.86H16.56A16.57,16.57,0,0,1,0,255.28V220.47A16.57,16.57,0,0,1,16.56,203.89Z"/>
                <path class="cls-1"
                      d="M16.56,135.93H53A16.56,16.56,0,0,1,69.55,152.5v34.82A16.56,16.56,0,0,1,53,203.89H16.56A16.56,16.56,0,0,1,0,187.32V152.5A16.56,16.56,0,0,1,16.56,135.93Z"/>
                <path class="cls-4"
                      d="M298.82,110.52c-4-3.18-9.89-4.77-18.19-4.77A109.7,109.7,0,0,0,262.44,107v58.76h13.34V144.46a35,35,0,0,0,4.59.26c7.94,0,14.74-1.94,19.33-6.27,3.53-3.36,5.47-8.31,5.47-14.14A17.44,17.44,0,0,0,298.82,110.52Zm-18.54,23.86a20.85,20.85,0,0,1-4.5-.35V116.44a23.13,23.13,0,0,1,5.56-.53c6.71,0,10.5,3.27,10.5,8.75C291.84,130.76,287.43,134.38,280.28,134.38ZM340,105.22c-17.57,0-29,13.34-29,31.19,0,17,10.33,30.31,28,30.31,17.39,0,29.22-11.84,29.22-31.37C368.2,118.92,358.23,105.22,340,105.22ZM339.69,156c-9,0-14.48-8.22-14.48-19.88s5.3-20.24,14.39-20.24c9.27,0,14.39,9.19,14.39,19.89C354,147.37,348.78,156,339.69,156Zm50.84-49.84H377v59.56h37.17V154.44H390.53Zm49.35,14.32c-1.77,4.24-3.18,7.69-4.5,11.4h-.18c-1.5-3.89-2.74-7.07-4.59-11.4l-6.09-14.32H409.16L428,141.36v24.39h13.42V140.92L461,106.19h-15.1Zm23-3h16v48.25H492.4V117.5h16.25V106.19H462.91Zm66.39,23.07h21.89v-11H529.3V117.24h23.22v-11H515.79v59.56h38v-11H529.3Zm64-24.22a29,29,0,0,1,11.3,2.21l2.74-10.69c-2.39-1.24-7.68-2.65-14.66-2.65-18,0-32.49,11.31-32.49,31.64,0,17,10.6,29.78,31.17,29.78,7.24,0,12.8-1.33,15.27-2.57l-2-10.51a33.61,33.61,0,0,1-11.21,1.94c-12,0-19.07-7.51-19.07-19.44C574.32,122.8,582.62,116.35,593.3,116.35Zm57.82,12.73H629V106.19H615.45v59.56H629V140.83h22.16v24.92h13.42V106.19H651.12Zm62.06-5.48a221.85,221.85,0,0,0,1.14,24.83h-.26A173.29,173.29,0,0,0,704.35,128L692,106.19H676.27v59.56h12.36V147.81c0-9.72-.17-18.11-.53-26l.27-.09a220.83,220.83,0,0,0,10.33,21l12.71,23h14.13V106.19H713.18Zm24,42.15h13.51V106.19H737.18ZM792.8,155.5c-12,0-19.07-7.51-19.07-19.44,0-13.26,8.3-19.71,19-19.71a29,29,0,0,1,11.3,2.21l2.74-10.69c-2.39-1.24-7.68-2.65-14.66-2.65-18,0-32.49,11.31-32.49,31.64,0,17,10.6,29.78,31.17,29.78,7.24,0,12.8-1.33,15.27-2.57l-2-10.51A33.61,33.61,0,0,1,792.8,155.5Z"/>
                <path class="cls-5"
                      d="M388.86,238.83l4.59,15.28h14.48l-18.46-59.56H371.82l-18.19,59.56h13.95l4.24-15.28Zm-15.1-10.08,3.53-12.64c1-3.44,1.86-8,2.74-11.48h.17c.89,3.53,1.95,8,3,11.48l3.7,12.64Z"/>
                <path class="cls-5" d="M415.86,194.55v59.56h13.51V194.55Z"/>
                <path class="cls-5"
                      d="M441,254.11h13.33V230.7h4.06c5.48.08,8,2.12,9.63,9.54,1.76,7.33,3.18,12.19,4.15,13.87H486c-1.15-2.29-3-10.07-4.86-16.79-1.5-5.48-3.79-9.45-7.94-11.13v-.27a15.79,15.79,0,0,0,10.5-14.67c0-5.47-1.94-9.63-5.47-12.46-4.24-3.35-10.42-4.68-19.25-4.68A117.7,117.7,0,0,0,441,195.35Zm13.33-49.57a33.34,33.34,0,0,1,6.09-.44c6.18.08,9.89,2.82,9.89,8.3,0,5.22-4,8.57-10.68,8.57h-5.3Z"/>
                <path class="cls-5" d="M493.37,254.11h37.17V242.8H506.88V194.55H493.37Z"/>
                <path class="cls-5" d="M538.48,194.55v59.56H552V194.55Z"/>
                <path class="cls-5"
                      d="M576,254.11V236.17c0-9.72-.17-18.11-.53-26l.27-.08a221.83,221.83,0,0,0,10.33,21l12.71,23H612.9V194.55H600.54V212a221.85,221.85,0,0,0,1.14,24.83h-.26a173.29,173.29,0,0,0-9.71-20.41l-12.36-21.83H563.63v59.56Z"/>
                <path class="cls-5" d="M659.94,218H638.05V205.6h23.22v-11H624.54v59.56h38v-11H638.05V228.93h21.89Z"/>
                <path class="cls-5"
                      d="M669.39,251.37c3.35,1.86,10.06,3.63,16.86,3.63,16.33,0,24-8.49,24-18.47,0-8.4-4.94-13.88-15.45-17.76-7.68-2.92-11-4.6-11-8.4,0-3.09,2.82-5.74,8.65-5.74a28.47,28.47,0,0,1,12.45,2.82l3-10.87a36.47,36.47,0,0,0-15.19-3c-14,0-22.51,7.78-22.51,17.94,0,8.66,6.44,14.14,16.33,17.58,7.15,2.57,10,4.69,10,8.4,0,3.89-3.27,6.45-9.45,6.45a34.24,34.24,0,0,1-14.92-3.71Z"/>
                <path class="cls-6"
                      d="M381.61,77.13a117,117,0,0,0,15.28.88c11.65,0,21.18-2.47,27.45-7.69,5.74-4.86,9.89-12.72,9.89-24.12,0-10.52-3.88-17.85-10.06-22.45-5.74-4.33-13.07-6.36-24.37-6.36a119.45,119.45,0,0,0-18.19,1.24Zm13.51-48.87a27.65,27.65,0,0,1,6.09-.53c11.57,0,18.81,6.54,18.72,18.91,0,14.23-7.95,20.94-20.13,20.85a25.22,25.22,0,0,1-4.68-.26Z"/>
                <path class="cls-6"
                      d="M455.41,77.39V59.45c0-9.72-.17-18.11-.53-26l.27-.09a222,222,0,0,0,10.33,21l12.71,23h14.13V17.83H480V35.24a222,222,0,0,0,1.14,24.83h-.26a173.29,173.29,0,0,0-9.71-20.41L458.77,17.83H443.05V77.39Z"/>
                <path class="cls-6" d="M504,17.83V77.39h13.51V17.83Z"/>
                <path class="cls-6"
                      d="M529.12,77.39h13.33V56.09a33.33,33.33,0,0,0,4.59.27c8,0,14.74-1.94,19.34-6.27,3.53-3.36,5.47-8.31,5.47-14.14a17.42,17.42,0,0,0-6.36-13.79c-4-3.18-9.89-4.77-18.18-4.77a109.7,109.7,0,0,0-18.19,1.24Zm13.33-49.31a23.19,23.19,0,0,1,5.56-.53c6.71,0,10.51,3.27,10.51,8.75,0,6.1-4.42,9.72-11.57,9.72a20.91,20.91,0,0,1-4.5-.35Z"/>
                <path class="cls-6"
                      d="M580.41,77.39h13.33V54h4.06c5.47.09,8,2.12,9.62,9.55,1.77,7.33,3.18,12.19,4.15,13.87h13.77c-1.14-2.3-3-10.07-4.85-16.79-1.5-5.48-3.8-9.45-8-11.13V49.2a15.8,15.8,0,0,0,10.51-14.67c0-5.48-1.94-9.63-5.48-12.46-4.23-3.36-10.41-4.68-19.24-4.68a117.6,117.6,0,0,0-17.92,1.24Zm13.33-49.57a32.9,32.9,0,0,1,6.09-.45c6.18.09,9.89,2.83,9.89,8.31,0,5.22-4,8.57-10.69,8.57h-5.29Z"/>
                <path class="cls-6"
                      d="M658.62,16.86c-17.57,0-29,13.34-29,31.19,0,17,10.33,30.31,28,30.31,17.39,0,29.22-11.84,29.22-31.37C686.87,30.56,676.9,16.86,658.62,16.86Zm-.35,10.69c9.27,0,14.39,9.19,14.39,19.88,0,11.58-5.21,20.24-14.3,20.24s-14.48-8.22-14.48-19.88S649.17,27.55,658.27,27.55Z"/>
            </svg>
        </div>
        <div class="header-content">
            <div class="header-text">
                <h1>${title}</h1>
            </div>
        </div>
    </header>

    <aside class="menu">
        <ul class="menu-list">
            <li class="menu-item">
                <a href="../clients/list" class="btn">
                    <div class="menu-item-content">
                        <i class="user icon"></i> Clients
                    </div>
                </a>
            </li>
            <li class="menu-item">
                <a href="../flights/list" class="btn">
                    <div class="menu-item-content">
                        <i class="plane icon"></i> Flights
                    </div>
                </a>
            </li>
            <li class="menu-item">
                <a href="../tickets/list" class="btn">
                    <div class="menu-item-content">
                        <i class="ticket alternate icon"></i> Tickets
                    </div>
                </a>
            </li>
            <#if isAdmin>
                <li class="menu-item">
                    <a href="../users/list" class="btn">
                        <div class="menu-item-content">
                            <i class="users icon"></i> Users
                        </div>
                    </a>
                </li>
            </#if>
        </ul>

        <form action="/logout" class="logout-form" method="post">
            <ul class="menu-list">
                <li class="menu-item">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn">
                        <div class="menu-item-content">
                            <i class="sign out alternate icon"></i> Logout
                        </div>
                    </button>
                </li>
            </ul>
        </form>

    </aside>

    <main class="content">
        <@content/>
    </main>

    </body>
    </html>
</#macro>