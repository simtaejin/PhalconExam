<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf as PresenceOf;
use Phalcon\Mvc\Model\Behavior\Timestampable;

class Board extends ModelBase
{
    public $table;
    public $idx;
    public $ref_group;
    public $ref_level;
    public $ref_order;
    public $member;
    public $title;
    public $content;
    public $hits;
    public $created;
    public $updated;
    public $temp;


    public function initialize()
    {
        $this->setschema("phalcon_exam");

        $this->allowEmptyStringValues(['title', 'content']);
        //$this->skipAttributes(['idx']);

    }


    public function setSource($source)
    {
        parent::setSource("board_" . $source); // TODO: Change the autogenerated stub
    }

    public function getSource()
    {
        return parent::getSource(); // TODO: Change the autogenerated stub
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

    public function findwithfile($parameters = null)
    {
        $t = parent::find($parameters);
        return $t;
        //return parent::find($parameters);
    }

    public function setTemp($idx)
    {
        $this->temp = $this->getSource()." ::::  ".$idx;
        //$this->temp = $temp;
    }

    public function getTemp()
    {
        return $this->temp;
    }

}
