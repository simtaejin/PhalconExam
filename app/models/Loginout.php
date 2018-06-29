<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Regex as RegexValidator;
use Phalcon\Validation\Validator\PresenceOf as PresenceOf;
use Phalcon\Security as Security;

class Loginout extends ModelBase
{
    public $idx;
    public $id;
    public $login;

    public function initialize()
    {
        $this->setSchema("phalcon_exam");
        $this->setSource("member");
    }

    public function getSource()
    {
        return 'member';
    }

    public function beforeValidationOnUpdate()
    {
        $this->login = date('Y-m-d H:i:s');
    }

}
