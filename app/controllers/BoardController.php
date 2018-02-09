<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class BoardController extends ControllerBase
{

    public function initialize()
    {
        $this->view->setVar("userId", $this->session->get("id"));

        $this->view->setTemplateAfter('backend');
    }


    public function indexAction()
    {
        $this->persistent->parameters = null;

        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');


        if (!$this->request->getQuery("page", "int")) {
            $numberPage = 1;
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }
        $parameters["order"] = "idx";

        $board = new Board();
        $board->setSource($board_id);
        $board_data = $board->find($parameters);

        $paginator = new Paginator([
            'data' => $board_data,
            'limit' => 10,
            'page' => $numberPage
        ]);

        $this->view->setVar('board_id', $board_id);
        $this->view->page = $paginator->getPaginate();

    }

    public function newAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');

        $this->view->setVar('board_id', $board_id);

        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("board/create");

            $board = new Board();
            $board->setSource($board_id);
            $board->title = $this->request->getPost("title");
            $board->content = $this->request->getPost("content");
            $board->member = $this->session->get("id");
            $board->hits = 0;

            if (!$board->create()) {
                foreach ($board->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            exit;
        }
    }

    public function editAction()
    {

    }
}