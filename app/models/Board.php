<?php

class board extends \phalcon\mvc\model
{
    public $idx;
    public $member;
    public $title;
    public $content;
    public $hits;
    public $created;
    public $updated;

    public function initialize()
    {
        $this->setschema("phalcon_exam");
        $this->setsource("board");
    }

    public function getsource()
    {
        return 'board';
    }

    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    public static function findfirst($parameters = null)
    {
        return parent::findfirst($parameters);
    }

}
