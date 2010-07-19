<?php
  include 'auth.php';
  include 'status_head.php';
  include 'menu.php';
?>

<td width="90%" valign="top">


<form id="form" name="form" method="post" action="fullstatus.php?report=<?php echo $report; ?>">
  <label>
  <select name="date">



<?php echo "<option value=\"$date\">$date</option>"; ?>

<?
foreach (glob("./reports/*$report.png") as $filename) {
  $filename = str_replace("./reports", "", $filename);
  $filename = str_replace("/", "", $filename);
  $filename = str_replace("-$report.png", "", $filename);
  $filename = str_replace("$date", "", $filename);
  $filename = str_replace("current", "", $filename);
  $filename = str_replace("$filename" , "<option value=\"$filename\">$filename</option>", $filename); 
     echo $filename;
}

?>

</select>
  </label>
  <label>
  <input type="submit" name="go" value="go" />
  </label>
</form>



    <img border=1 src=./reports/<?php echo "$date-$report"; ?>.png></img>
    <br><br>
    <textarea cols="125" rows="25"><?php include "./reports/$date-$report.txt"; ?></textarea>
    </td>
  </tr>
</table>
</body>
</html>

