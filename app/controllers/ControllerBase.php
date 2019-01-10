<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    public $BaseBoardDate;

    public function initialize()
    {
        if ($this->dispatcher->getControllerName() != "loginout") {
            /*
            if (!$this->session->get("id")) {
                $this->response->redirect("loginout/login");
            }
            */

            if (!$this->session->get('role') || $this->session->get('role') == "user") {
                $this->view->setTemplateAfter('frontend');
            } else if ($this->session->get('role') == "operator") {
                $this->view->setTemplateAfter('backend');
            }


            $this->view->setVar("userId", $this->session->get("id"));

            $BaseBoard = new SetupBoard();
            $BaseBoard->setSource("board");
            $BaseBoardDate = $BaseBoard->find(['order' =>'idx desc']);

            $this->BaseBoardDate = $BaseBoardDate;

            $this->view->setVar("bbd", $this->BaseBoardDate);
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
