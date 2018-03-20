<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Db\Column as Column;

class SetupController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('backend');
        $this->view->setVar("userId", $this->session->get("id"));
    }


    public function indexAction()
    {
     
    }

    public function boardAction()
    {
        $this->persistent->parameters = null;

        if (!$this->dispatcher->getParam('page')) {
            $numberPage = 1;
        } else {
            $numberPage = $this->dispatcher->getParam('page');
        }

        $parameters["order"] = "idx desc";

        $sb = new SetupBoard();
        $sb->setSource("board");
        $sb_data = $sb->find($parameters);

        $paginator = new Paginator([
            'data' => $sb_data,
            'limit' => 10,
            'page' => $numberPage
        ]);   

        $this->view->page = $paginator->getPaginate();
    }

    public function board_createAction()
    {
        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("setup/board/create/");

            $board = new SetupBoard();
            $board->setSource("board");
            $board->id = $this->request->getPost("id");
            $board->name = $this->request->getPost("name");

            if (!$board->create()) {
                foreach ($board->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            } else {
                $table_id = "board_".$board->id;

                if (!$this->db->tableExists($table_id)) {

                    $this->db->createTable(
                        $table_id,
                        null,
                        [
                            'columns' => [
                                new Column('idx',['type'=> Column::TYPE_INTEGER,'size'=> 11,'notNull'=> true,'autoIncrement' => true,'primary'=> true,]),
                                new Column('member',['type'=> Column::TYPE_VARCHAR,'size'=> 50,'notNull' => true,]),
                                new Column('title',['type'=> Column::TYPE_VARCHAR,'size'=> 255,'notNull' => true,]),
                                new Column('content',['type'=> Column::TYPE_TEXT,]),
                                new Column('hits',['type'=> Column::TYPE_INTEGER,'size'=> 11,'notNull'=> false,'default' => null,]),
                                new Column('created',['type'=> Column::TYPE_DATETIME,'notNull'=> true,'default' => '0000-00-00 00:00:00',]),
                                new Column('updated',['type'=> Column::TYPE_DATETIME,'notNull'=> true,'default' => '0000-00-00 00:00:00',]),
                            ]
                        ]
                    );
                }
            }

            exit;
        }
    }

    public function board_updateAction()
    {
        $idx = $this->dispatcher->getParam('idx');
      
        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("setup/board/create/");

            $sb = new SetupBoard();
            $sb->setSource("board");
            $this->request->get('idx');
            $sb_data = $sb->findFirstByIdx($idx);

            $sb_data->name = $this->request->getPost("name");

            if (!$sb_data->update()) {
                foreach ($sb_data->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            exit;
        } else {
            $sb = new SetupBoard();
            $sb->setSource("board");
            $sb_data = $sb->findFirstByIdx($idx);

            $this->view->setVar("idx", $sb_data->idx);
            $this->view->setVar("id", $sb_data->id);
            $this->view->setVar("name", $sb_data->name);
        }
    }

    public function board_deleteAction()
    {
        $idx = $this->dispatcher->getParam('idx');

        $sb = new SetupBoard();
        $sb->setSource("board");
        $sb_data = $sb->findFirstByIdx($idx);

        if ($sb_data->delete()) {
            $this->db->dropTable("board_".$sb_data->id);
        }
    }
}