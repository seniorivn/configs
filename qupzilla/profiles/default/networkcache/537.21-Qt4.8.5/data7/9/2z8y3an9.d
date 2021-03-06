   �      5http://yandex.st/wow/2.29/static/js/update_session.js %����  %|M��8         
     O K           �      Server   nginx/1.5.8   Content-Type   application/x-javascript   Last-Modified   Thu, 26 Dec 2013 08:05:39 GMT   Expires   Thu, 31 Dec 2037 23:55:55 GMT   Cache-Control   max-age=315360000, public   Access-Control-Allow-Origin   *   Content-Encoding   gzip y5.require(
    ['Cookies'],
    function() {
        /**
         * Обновляет сессию с помощью редиректа на паспорт.
         */
        function updateSession()
        {
            y5.Cookies.set('Cookie_check', '1', false); // для текущего домена
            var loc = window.location;
            var url = loc.protocol.concat('//', loc.host) + '/pass?retpath=' + encodeURIComponent(window.parent.friendsURL('update_session'));
            window.location.replace(url);
        }

        // обновляем сессию каждые 55 минут
        var update_delta = 55*1000*60;
        if (update_delta) window.setTimeout(updateSession, update_delta);
    }
)
