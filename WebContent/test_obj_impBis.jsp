<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des objets implicites EL</title>
    </head>
    <body>
    <p>
	Langue : ${ param.langue }
	<!-- http://localhost:8080/WebTest/test_obj_impBis.jsp?langue=zh&langue=fr -->
	Langues : ${ paramValues.langue[0] }
	Langues : ${ paramValues.langue[1] }
	<br />
	Article : ${ param.article }
    </p>
    </body>
</html>