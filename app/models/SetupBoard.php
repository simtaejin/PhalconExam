<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf as PresenceOf;

class SetupBoard extends \phalcon\mvc\model
{
    public $idx;
    public $id;
    public $name;
    public $created;

    public function initialize()
    {

        $this->setschema("phalcon_exam");

        $this->allowEmptyStringValues(['id', 'name']);
        //$this->skipAttributes(['idx']);
    }


    public function setSource($source)
    {
        parent::setSource("setup_".$source); // TODO: Change the autogenerated stub
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

        $validator->add(['id','name'], new PresenceOf([
            'message' => [
                'id' => 'id을 입력하세요.',                
                'name' => 'title을 입력하세요.'
            ],
        ]));

        return $this->validate($validator);
    }
}
