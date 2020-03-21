<!DOCTYPE html>
<?php
	require("{$_SERVER['HOME']}/.conf/functions.php");
	$appLog = '/var/www/clients/client1/web1/tmp/app.log';
	edump($_SERVER);
	$curDir = dirname($_SERVER['PHP_SELF']);
	echo <<<EOF
<html>
	<head>
		<base href="$curDir/" />
		<link href="css/fontawesome.5.8.1.css" rel="stylesheet"></link>
		<link href="css/woff2.css" rel="stylesheet"></link>			
		<meta charset="UTF-8">
		<title>goMap-1.0</title>
	<link href="./css/goMap.css" rel="stylesheet"></head>
	<body>
	<script src="https://maps.googleapis.com/maps/api/js?key=$gmaps_api_key"
></script>
	<script type="text/javascript" src="./js/goMap.js"></script></body>
</html>

EOF;
?>
