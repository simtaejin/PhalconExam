<?php

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
    }

    /**
     * 회원등록 페이지
     */
    public function createAction()
    {

    }

    /**
     * 회원등록
     */
    public function saveAction()
    {
        if ($this->security->checkToken() == false) {
            $this->flash->error('Invalid CSRF Token');
            $this->response->redirect("member/create");
            return;
        }

        $this->view->disable();

        $security = new \Phalcon\Security();

        $member = new Member();
        $member->id = $this->request->getPost("id");
        $member->password = $security->hash($this->request->getPost("password"));
        $member->email = $this->request->getPost("email");
        $member->created = date('Y-m-d H:i:s');

        if (!$member->save()) {
            foreach ($member->getMessages() as $message) {
                echo $message . "<br>";
            }
            return;
        }

        exit;
    }

    /**
     * 회원삭제
     */
    public function deRegisterAction()
    {

    }

    public function editAction($id)
    {
        $user = Member::findFirstById($id);

        $this->tag->setDefault("id", $user->id);
        $this->view->setVar("id", $user->id);
        $this->view->setVar("email", $user->email);
    }

    public function updateAction()
    {

        if ($this->security->checkToken() == false) {
            $this->flash->error('Invalid CSRF Token');
            $this->response->redirect("member/modify/".$this->request->getPost("id"));

            return;
        }

        $this->view->disable();

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
    }
}

