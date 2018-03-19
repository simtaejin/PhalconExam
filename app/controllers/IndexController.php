<?php

class IndexController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('backend');
    }

    public function indexAction()
    {


    }

}