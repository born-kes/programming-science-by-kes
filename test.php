<?php

echo 'hello World';
$bat_name = 'test.bat';


echo'<br>';
echo'<br>';
echo'<pre>';
echo shell_exec($bat_name);
echo'</pre>';
echo exec($bat_name); 
echo'<br>';
system ("cmd /c {$bat_name}");
