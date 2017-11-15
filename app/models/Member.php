<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Member extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $Idx;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $Id;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $Password;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $Email;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Created;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Login;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        /*
        $validator = new Validation();

        $validator->add(
            'Email',
            new EmailValidator(
                [
                    'model' => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
        */
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("phalcon_exam");
        $this->setSource("member");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'member';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Member[]|Member|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Member|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
