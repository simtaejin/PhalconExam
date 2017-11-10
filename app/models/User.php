<?php

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class User extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=10, nullable=false)
     */
    public $Id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $Email;

    /**
     *
     * @var string
     * @Column(type="string", length=128, nullable=false)
     */
    public $Password;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $Role;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $Deleted;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $Created_at;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $Updated_at;

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
                    'model'   => $this,
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
        $this->setSource("user");
        $this->hasMany('id', 'Project', 'user_id', ['alias' => 'Project']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'user';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]|User|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
