<?php

	$dbInfo = array(
		"server" => "mysql3.ebola.cz",
		"db" => "jarnikcom_jarnik",
		"user" => "jarnikcom_jarnik",
		"pass" => "b166er",
	);

	$db = mysql_connect( $dbInfo["server"],  $dbInfo["user"],  $dbInfo["pass"] )
		or die(mysql_error());
	mysql_select_db( $dbInfo["db"]) or die(mysql_error());

	function vote($id) {
		if ( !preg_match("/^(\w)+$/i", $id) ) {
			echo "wrong id ".$id;
			return;
		}
		$query = "INSERT INTO ld28 (id, time, value) VALUES ('',CURRENT_TIMESTAMP,'".$id."');";
		$result = mysql_query($query) or die(mysql_error());
	}

	function getStats() {
		$query = "SELECT value, COUNT(id) AS count FROM `ld28` GROUP BY value ORDER BY count DESC;";	
		$result = mysql_query($query) or die(mysql_error());
		$output = array();
		while ( $row = mysql_fetch_row($result) ) {
			$output[] = $row[0].":".$row[1];
		}
		echo join( $output, "," );
	}

	if ( isset( $_POST['id'] ) )
	   vote( $_POST['id'] );
	   
	getStats();
	
	mysql_close($this->db);

?>