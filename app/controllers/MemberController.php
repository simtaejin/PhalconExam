<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class MemberController extends ControllerBase
{
    public function initialize()
    {
//        if (!$this->session->get("id")) {
//            $this->response->redirect("loginout/login");
//        }
        $this->view->setVar("userId", $this->session->get("id"));

        $this->view->setTemplateAfter('backend');
    }

    public function indexAction()
    {
        $this->persistent->parameters = null;


        if (!$this->request->getQuery("page", "int")) {
            $numberPage = 1;
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters["order"] = "id";
        $user = Member::find($parameters);

        $paginator = new Paginator([
            'data' => $user,
            'limit' => 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * 회원 등록
     */
    public function newAction()
    {
        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("member/create");

            $security = new \Phalcon\Security();

            $temp =  Member::findFirstById($this->request->getPost("id"));
            if ($temp) {
                echo "이미 있는 ID 입니다.";
                exit;
            }

            $member = new Member();
            $member->id = $this->request->getPost("id");
            $member->password = $security->hash($this->request->getPost("password"));
            $member->email = $this->request->getPost("email");
            $member->created = date('Y-m-d H:i:s');

            if (!$member->create()) {
                foreach ($member->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            exit;
        }
    }

    /**
     * 회원 수정
     * @param $id
     */
    public function editAction($id)
    {
        if ($this->request->isPost()) {
            $this->view->disable();

            $this->component->helper->csrf("member/modify/" . $this->request->getPost("id"));

            $security = new \Phalcon\Security();

            $member = Member::findFirstById($this->request->getPost("id"));
            $member->password = $security->hash($this->request->getPost("password"));
            $member->email = $this->request->getPost("email");

            if (!$member->update()) {
                foreach ($member->getMessages() as $message) {
                    echo $message . "<br>";
                }
                return;
            }

            exit;
        } else {
            $user = Member::findFirstById($id);

            $this->tag->setDefault("id", $user->id);
            $this->view->setVar("id", $user->id);
            $this->view->setVar("email", $user->email);
        }
    }

    /**
     * 회원 삭제
     * @param $id
     */
    public function deleteAction($id)
    {
        $user = Member::findFirstByid($id);
        $user->delete();
    }
}

