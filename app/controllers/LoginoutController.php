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
     * 회원등록
     */
    public function RegisterAction()
    {

    }

    /**
     * 회원삭제
     */
    public function deRegisterAction()
    {

    }

    /**
     * 회원로그인
     */
    public function loginAction()
    {
/*
 *     <link href="/public/third-party/signin.css" rel="stylesheet">
 * */
        $this->assets->collection('extra')->addCss('third-party/signin.css');
        $this->view->disableLevel(\Phalcon\Mvc\View::LEVEL_AFTER_TEMPLATE);
    }

    /**
     * 회원로그아웃
     */
    public function  logoutAction()
    {

    }

}