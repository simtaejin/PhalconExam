<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class BoardController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('backend');
        $this->view->setVar("userId", $this->session->get("id"));
    }

    public function indexAction()
    {
        $this->persistent->parameters = null;

        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        if (!$this->dispatcher->getParam('page')) {
            $numberPage = 1;
        } else {
            $numberPage = $this->dispatcher->getParam('page');
        }

        $parameters["order"] = "idx desc";

        try {
            $board = new Board();
            $board->setSource($board_id);
            $board_data = $board->find($parameters);
        } catch (Exception   $e) {
            $this->component->helper->alert("해당 게시판이 없습니다.", "/setup/board/");
            exit;
        }
       
        $paginator = new Paginator([
            'data' => $board_data,
            'limit' => 10,
            'page' => $numberPage
        ]);



        $this->view->setVar('board_id', $board_id);
        $this->view->page = $paginator->getPaginate();
    }

    public function createAction()
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

            $this->component->helper->alert("글 등록 되었습니다.", "/board/".$board_id."/");
        }
    }

    public function selectAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        $board = new Board();
        $board->setSource($board_id);
        $board_data = $board->findFirstByIdx($board_idx);

        $this->view->setVar("board_id", $board_id);
        $this->view->setVar("board_idx", $board_idx);
        $this->view->setVar("title", $board_data->title);
        $this->view->setVar("content", $board_data->content);
    }

    public function updateAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');
        
        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("board/create");
            
            $board = new Board();
            $board->setSource($board_id);
            $board_data = $board->findFirstByIdx($board_idx);
            $board_data->title = $this->request->getPost("title");
            $board_data->content = $this->request->getPost("content");

            if (!$board_data->update()) {
                foreach ($board_data->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            $this->component->helper->alert("글 수정 되었습니다.", "/board/".$board_id."/select/".$board_idx);

        } else {
            $board = new Board();
            $board->setSource($board_id);
            $board_data = $board->findFirstByIdx($board_idx);
    
            $this->view->setVar("board_id", $board_id);
            $this->view->setVar("board_idx", $board_idx);
            $this->view->setVar("title", $board_data->title);
            $this->view->setVar("content", $board_data->content);

        }
    }

    public function deleteAction() 
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        $board = new Board();
        $board->setSource($board_id);
        $board_data = $board->findFirstByIdx($board_idx);

        if (!$board_data->delete()) {
            foreach ($board->getMessages() as $message) {
                echo $message . "<br>";
            }
            return;
        }

        $this->component->helper->alert("회원 삭제 되었습니다.", "/board/".$board_id."/");
           
    }
}