<?php

class LoginoutController extends ControllerBase
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
     * 회원로그인
     */
    public function loginAction()
    {
        $this->assets->collection('extra')->addCss('third-party/signin.css');
        $this->view->disableLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE);
    }


    /**
     * 회원로그인 처리
     */
    public function dologinAction()
    {

        $this->view->disable();

        $this->component->helper->csrf("loginout/login");

        $id = $this->request->getPost('inputId');
        $password = $this->request->getPost('inputPassword');

        $user = Member::findFirstById($id);
        if ($user) {
            if ($this->security->checkHash($password, $user->password)) {
                $this->session->set('id', $user->id);
                $this->response->redirect("index");
            } else {
                $this->flash->error('Incorrect Credentials');
                $this->response->redirect("loginout/login");
            }
        } else {
            $this->flash->error('Incorrect Credentials');
            $this->response->redirect("loginout/login");
        }
    }


    /**
     * 회원로그아웃
     */
    public function dologoutAction()
    {
        $this->session->destroy();
        $this->response->redirect("loginout/login");
    }

}