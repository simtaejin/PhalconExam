<?php

use Phalcon\Mvc\Model\Message;
use Phalcon\Mvc\Model\Criteria;

use Phalcon\Paginator\Adapter\Model as Paginator;

class BoardController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('backend');
        $this->view->setVar("userId", $this->session->get("id"));

        try {
            $board = new Board();
        } catch (Exception   $e) {
          
        }
    }

    public function indexAction()
    {
        $this->persistent->parameters = null;

        $board_id = $this->dispatcher->getParam('board_id');

        if (!$this->dispatcher->getParam('page')) {
            $numberPage = 1;
        } else {
            $numberPage = $this->dispatcher->getParam('page');
        }

        $parameters["order"] = "ref_group desc, ref_order asc";

		$board = new Board();
		$board->setSource($board_id);

		$board_data = $board->findwithfile($parameters);

        $paginator = new Paginator([
            'data' => $board_data,
            'limit' => 10,
            'page' => $numberPage
        ]);

        $this->view->setVar('board_id', $board_id);
        $this->view->page = $paginator->getPaginate();
        $this->view->files = $board_data->temp;
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


            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();

                foreach ($files as $file) {

                }
            }

            if (!$board->create()) {
                foreach ($board->getMessages() as $message) {
                    if ($message == "title is required") {
                    }
                    if ($message == "content is required") {
                    }
                }
                return;
            } else {

                $temp = new Board();
                $temp->setSource($board_id);
                $temp_data = $temp->findFirstByIdx($board->idx);

                $temp_data->ref_group = $board->idx;
                $temp_data->update();
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
        //$board_data = $board->findFirstByIdx($board_idx);
        $board_data = $board->findwithfile(
            [
                "idx = :idx: ",
                "bind" => ["idx"=>$board_idx]
            ]
        );

        $sess = "sess_".$board_id."_".$board_idx;
        if (!$this->session->has($sess)) {
            $this->session->set($sess, $sess);
            $result = $this->db->execute(
                "update `board_".$board_id."` set  `hits` = `hits` + 1 where `idx` = ? ",
                [$board_idx]
            );
        }

        $this->view->setVar("board_id", $board_id);
        $this->view->setVar("board_idx", $board_idx);
        $this->view->setVar("title", $board_data[0]->title);
        $this->view->setVar("content", $board_data[0]->content);
        $this->view->setVar("files", $board_data->temp);
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
    
    public function replycreateAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        $this->view->setVar('board_id', $board_id);

        if ($this->request->isPost()) {
            $this->view->disable();

            $ref_group = $this->request->getPost("ref_group");
            $ref_level = $this->request->getPost("ref_level");
            $ref_order = $this->request->getPost("ref_order");

            //$this->component->helper->csrf("board/replycreate");
    
            $result = $this->db->execute(
                "update `board_".$board_id."` set  `ref_order` = `ref_order` + 1 where `ref_group` = ? and `ref_order` > ?",
                [$ref_group, $ref_order]
            );

            $ref_level = $ref_level + 1;
            $ref_order = $ref_order + 1;

            $board = new Board();
            $board->setSource($board_id);

            $board->ref_group = $ref_group;
            $board->ref_level = $ref_level;
            $board->ref_order = $ref_order;
            $board->title = $this->request->getPost("title");
            $board->content = $this->request->getPost("content");
            $board->member = $this->session->get("id");

            if (!$board->create()) {
                foreach ($board->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            $this->component->helper->alert("글 등록 되었습니다.", "/board/".$board_id."/");

        } else {
            $board = new Board();
            $board->setSource($board_id);
            $board_data = $board->findFirstByIdx($board_idx);
  
            //$this->component->helper->printr($board_data);
 
            $this->view->setVar("board_id", $board_id);
            $this->view->setVar("board_idx", $board_idx);
            $this->view->setVar("ref_group", $board_data->ref_group);
            $this->view->setVar("ref_level", $board_data->ref_level);
            $this->view->setVar("ref_order", $board_data->ref_order);
            $this->view->setVar("title", $board_data->title);
            $this->view->setVar("content", $board_data->content);            
        }
    }
}