<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public function initialize()
    {
        if ($this->dispatcher->getControllerName() != "loginout") {
            if (!$this->session->get("id")) {
                $this->response->redirect("loginout/login");
            }

            $this->view->setVar("userId", $this->session->get("id"));

            $BaseBoard = new SetupBoard();
            $BaseBoard->setSource("board");
            $BaseBoardDate = $BaseBoard->find(['order' =>'idx desc']);

            $this->view->setVar("bbd", $BaseBoardDate);
        }
    }

    public function indexAction()
    {

    }

    public function beforeExecuteRoute()
    {

    }

    public function afterExecuteRoute()
    {

    }
}
