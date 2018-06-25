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

        $board_data = $board->finds($parameters);

        $paginator = new Paginator([
            'data' => $board_data,
            'limit' => 10,
            'page' => $numberPage
        ]);

        $this->view->setVar('board_id', $board_id);
        $this->view->page = $paginator->getPaginate();
        $this->view->files = $board_data->files;
        $this->view->comments = $board_data->comments;

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


                if ($this->request->hasFiles()) {

                    if (!is_dir($this->config->application->dataDir . "/board/" . $board_id)) {
                        mkdir($this->config->application->dataDir, 0777);
                        mkdir($this->config->application->dataDir . "/board/", 0777);
                        mkdir($this->config->application->dataDir . "/board/" . $board_id, 0777);
                    }

                    foreach ($this->request->getUploadedFiles() as $k => $v) {

                        $files = new Files();
                        $files->setSource("file_boards");
                        $files->board_id = $board->getSource();
                        $files->board_idx = $board->idx;
                        $files->file_type = $v->getType();
                        $files->file_size = $v->getSize();
                        $files->origina_name = $v->getName();
                        $files->artifical_name = Phalcon\Text::random(Phalcon\Text::RANDOM_ALNUM) . "." . $v->getExtension();

                        $files->create();
                        $v->moveTo($this->config->application->dataDir . "/board/" . $board_id . "/" . Phalcon\Text::random(Phalcon\Text::RANDOM_ALNUM) . "." . $v->getExtension());

                    }

                }

            }

            $this->component->helper->alert("글 등록 되었습니다.", "/board/" . $board_id . "/");
        }
    }

    public function selectAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        $board = new Board();
        $board->setSource($board_id);
        //$board_data = $board->findFirstByIdx($board_idx);

        $board_data = $board->finds([
            "idx = :idx: ",
            "bind" => ["idx" => $board_idx]
        ]);

        $sess = "sess_" . $board_id . "_" . $board_idx;
        if (!$this->session->has($sess)) {
            $this->session->set($sess, $sess);
            $result = $this->db->execute(
                "update `board_" . $board_id . "` set  `hits` = `hits` + 1 where `idx` = ? ",
                [$board_idx]
            );
        }

        $this->view->setVar("board_id", $board_id);
        $this->view->setVar("board_idx", $board_idx);
        $this->view->setVar("title", $board_data[0]->title);
        $this->view->setVar("content", $board_data[0]->content);
        $this->view->setVar("files", $board_data->files);
        $this->view->setVar("comments", $board_data->comments);
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

            $this->component->helper->alert("글 수정 되었습니다.", "/board/" . $board_id . "/select/" . $board_idx);

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

        $this->component->helper->alert("회원 삭제 되었습니다.", "/board/" . $board_id . "/");

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

            $this->component->helper->csrf("board/replycreate");

            $result = $this->db->execute(
                "update `board_" . $board_id . "` set  `ref_order` = `ref_order` + 1 where `ref_group` = ? and `ref_order` > ?",
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

            $this->component->helper->alert("글 등록 되었습니다.", "/board/" . $board_id . "/");

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

    public function commnetcreateAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        if ($this->request->isAjax()) {
            $this->view->disable();

            $board = new Board();
            $board->setSource($board_id);

            $comments = new Comments();
            $comments->setSource("comment_boards");
            $comments->board_id = $board->getSource();
            $comments->board_idx = $board_idx;
            $comments->memo = $this->request->getPost("memo");
            $comments->member = $this->session->get("id");

            if ($comments->create()) {
                $comment_data = Comments::find(
                    [
                        "board_id = :board_id: AND board_idx = :board_idx:",
                        "bind" => ["board_id" => $board->getSource(), "board_idx" => $board_idx]
                    ]
                );

                $result['code'] = "00";
                $result['msg'] = "등록 되었습니다.";

                $result['value'] = "<table class=\"table table-bordered\">
                                        <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>memo</th>
                                            <th>Member</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>";

                foreach ($comment_data as $k => $v) {
                    $k = $k+1;
                    $result['value'] .= "<tr>
                                            <td>{$k}</td>
                                            <td><span id=\"txt_comment_selete_".$v->idx."\">".nl2br($v->memo)."</span></td>
                                            <td>{$v->member}</td>
                                            <td><span id=\"btn_comment_selete_".$v->idx."\" onClick=\"btn_comment_selete('btn_comment_selete_".$v->idx."')\" >수정</span></td>
                                            <td><span id=\"btn_comment_delete_".$v->idx."\" onClick=\"btn_comment_delete('btn_comment_delete_".$v->idx."')\" >삭제</span></td>
                                           </tr>";
                }

                $result['value'] .= "   </tbody>
                                       </table>";

                echo json_encode($result);
            }

            exit;
        }
    }

    public function commnetupdateAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        if ($this->request->isAjax()) {
            $this->view->disable();

            $select_comment_idx = $this->request->getPost("select_comment_idx");

            $board = new Board();
            $board->setSource($board_id);

            $comments = new Comments();
            $comments->setSource("comment_boards");

            $comments_date = $comments->findFirstByIdx($select_comment_idx);
            $comments_date->memo = $this->request->getPost("memo");

            if ($comments_date->update()) {
                $result['code'] = "00";
                $result['msg'] = "수정 되었습니다.";

                $comment_data = Comments::find(
                    [
                        "board_id = :board_id: AND board_idx = :board_idx:",
                        "bind" => ["board_id" => $board->getSource(), "board_idx" => $board_idx]
                    ]
                );  
                

                $result['value'] = "<table class=\"table table-bordered\">
                                        <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>memo</th>
                                            <th>Member</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>";

                foreach ($comment_data as $k => $v) {
                    $k = $k+1;
                    $result['value'] .= "<tr>
                                        <td>{$k}</td>
                                        <td><span id=\"txt_comment_selete_".$v->idx."\">".nl2br($v->memo)."</span></td>
                                        <td>{$v->member}</td>
                                        <td><span id=\"btn_comment_selete_".$v->idx."\" onClick=\"btn_comment_selete('btn_comment_selete_".$v->idx."')\" >수정</span></td>
                                        <td><span id=\"btn_comment_delete_".$v->idx."\" onClick=\"btn_comment_delete('btn_comment_delete_".$v->idx."')\" >삭제</span></td>
                                    </tr>";                                           
                }

                $result['value'] .= "   </tbody>
                                    </table>";

                echo json_encode($result);

            }

            exit;
        }
    }

    public function commentdeleteAction()
    {
        $board_id = $this->dispatcher->getParam('board_id');
        $board_idx = $this->dispatcher->getParam('idx');

        if ($this->request->isAjax()) {
            $this->view->disable();

            $comment_idx = $this->request->getPost("comment_idx");

            $board = new Board();
            $board->setSource($board_id);

            $comments = new Comments();
            $comments->setSource("comment_boards");

            $comments_date = $comments->findFirstByIdx($comment_idx);

            if ($comments_date->delete()) {
                $result['code'] = "00";
                $result['msg'] = "삭제 되었습니다.";

                $comment_data = Comments::find(
                    [
                        "board_id = :board_id: AND board_idx = :board_idx:",
                        "bind" => ["board_id" => $board->getSource(), "board_idx" => $board_idx]
                    ]
                );


                $result['value'] = "<table class=\"table table-bordered\">
                                        <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>memo</th>
                                            <th>Member</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>";

                foreach ($comment_data as $k => $v) {
                    $k = $k+1;                    
                    $result['value'] .= "<tr>
                                            <td>{$k}</td>
                                            <td><span id=\"txt_comment_selete_".$v->idx."\">".nl2br($v->memo)."</span></td>
                                            <td>{$v->member}</td>
                                            <td><span id=\"btn_comment_selete_".$v->idx."\" onClick=\"btn_comment_selete('btn_comment_selete_".$v->idx."')\" >수정</span></td>
                                            <td><span id=\"btn_comment_delete_".$v->idx."\" onClick=\"btn_comment_delete('btn_comment_delete_".$v->idx."')\" >삭제</span></td>
                                        </tr>";
                }

                $result['value'] .= "   </tbody>
                                       </table>";


                echo json_encode($result);
            }

            exit;
        }
    }
}