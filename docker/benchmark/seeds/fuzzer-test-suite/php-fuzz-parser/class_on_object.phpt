<?php

$obj = new stdClass;
var_dump($obj::class);
$ref =& $obj;
var_dump($ref::class);
var_dump((new stdClass)::class);

// Placed in a function to check that opcache doesn't perform incorrect constprop.
function test() {
    $other = null;
    var_dump($other::class);
}
try {
    test();
} catch (TypeError $e) {
    echo $e->getMessage(), "\n";
}

?>