<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf as PresenceOf;

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

        $this->allowEmptyStringValues(['title', 'content']);
        //$this->skipAttributes(['idx']);
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

    public function beforeValidationOnCreate()
    {
        $this->created = date('Y-m-d H:i:s');
    }

    public function validation()
    {
        $validator = new Validation();

        $validator->add(['title', 'content'], new PresenceOf([
            'message' => [
                'title' => 'title을 입력하세요.',
                'content' => 'content을 입력하세요.'
            ],
        ]));

        return $this->validate($validator);


    }
}
