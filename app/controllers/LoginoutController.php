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
        print_r($_REQUEST);
    }
    

    /**
     * 회원로그아웃
     */
    public function logoutAction()
    {

    }

}