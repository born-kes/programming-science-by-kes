<?php
namespace Basic;

require_once('./vendor/autoload.php');

class Basic {

    public function __construct(Routing $routing) {
        $this->routing = $routing;

}

public function run(){
        return $this->routing->get('b');
    }

}
