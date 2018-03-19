<?php

use Phalcon\Mvc\Model;

class ModelBase extends \Phalcon\Mvc\Model
{

    public function initialize()
    {

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