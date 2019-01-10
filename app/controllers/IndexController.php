<?php

use Phalcon\Mvc\Controller;

class IndexController extends ControllerBase

{

    public function initialize()
    {
        parent::initialize();
//        $this->view->setTemplateAfter('backend');
    }

    public function indexAction()
    {
        parent::initialize();

        $board = new Board();
        $board->setSource("test1");
        $test_data = $board->latest(1);

        $this->view->setVar("tbd", $test_data[0]);

//        $board = new Board();
//        $board->setSource("test");
//        $board_data = $board->latest(1);
//
//        var_dump($board_data);

//        foreach ($board_data as $k => $v) {
//            echo "<xmp>";
//            print_r($v);
//            echo "</xmp>";
//        }

    }

}