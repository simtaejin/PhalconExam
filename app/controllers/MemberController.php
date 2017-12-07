<?php

class MemberController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('backend');
    }

    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * 회원등록
     */
    public function doRegisterAction()
    {
        if ($this->security->checkToken() == false) {
            $this->flash->error('Invalid CSRF Token');
            $this->response->redirect("member/register");
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
                echo $message."<br>";
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

}

