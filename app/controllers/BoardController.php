<?php
 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class BoardController extends ControllerBase
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for board
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Board', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "idx";

        $board = Board::find($parameters);
        if (count($board) == 0) {
            $this->flash->notice("The search did not find any board");

            $this->dispatcher->forward([
                "controller" => "board",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $board,
            'limit'=> 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displays the creation form
     */
    public function newAction()
    {

    }

    /**
     * Edits a board
     *
     * @param string $idx
     */
    public function editAction($idx)
    {
        if (!$this->request->isPost()) {

            $board = Board::findFirstByidx($idx);
            if (!$board) {
                $this->flash->error("board was not found");

                $this->dispatcher->forward([
                    'controller' => "board",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->idx = $board->idx;

            $this->tag->setDefault("idx", $board->idx);
            $this->tag->setDefault("member", $board->member);
            $this->tag->setDefault("title", $board->title);
            $this->tag->setDefault("content", $board->content);
            $this->tag->setDefault("hits", $board->hits);
            $this->tag->setDefault("created", $board->created);
            $this->tag->setDefault("updated", $board->updated);
            
        }
    }

    /**
     * Creates a new board
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'index'
            ]);

            return;
        }

        $board = new Board();
        $board->idx = $this->request->getPost("idx");
        $board->member = $this->request->getPost("member");
        $board->title = $this->request->getPost("title");
        $board->content = $this->request->getPost("content");
        $board->hits = $this->request->getPost("hits");
        $board->created = $this->request->getPost("created");
        $board->updated = $this->request->getPost("updated");
        

        if (!$board->save()) {
            foreach ($board->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("board was created successfully");

        $this->dispatcher->forward([
            'controller' => "board",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a board edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'index'
            ]);

            return;
        }

        $idx = $this->request->getPost("idx");
        $board = Board::findFirstByidx($idx);

        if (!$board) {
            $this->flash->error("board does not exist " . $idx);

            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'index'
            ]);

            return;
        }

        $board->idx = $this->request->getPost("idx");
        $board->member = $this->request->getPost("member");
        $board->title = $this->request->getPost("title");
        $board->content = $this->request->getPost("content");
        $board->hits = $this->request->getPost("hits");
        $board->created = $this->request->getPost("created");
        $board->updated = $this->request->getPost("updated");
        

        if (!$board->save()) {

            foreach ($board->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'edit',
                'params' => [$board->idx]
            ]);

            return;
        }

        $this->flash->success("board was updated successfully");

        $this->dispatcher->forward([
            'controller' => "board",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a board
     *
     * @param string $idx
     */
    public function deleteAction($idx)
    {
        $board = Board::findFirstByidx($idx);
        if (!$board) {
            $this->flash->error("board was not found");

            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'index'
            ]);

            return;
        }

        if (!$board->delete()) {

            foreach ($board->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "board",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("board was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "board",
            'action' => "index"
        ]);
    }

}
