<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id_user';
    protected $returnType = 'array';
    protected $allowedFields = ['first_name', 'last_name', 'nickname',
    'email', 'password','user_level','gender','last_connection','account_status'];

    protected $validationRules = [
		'first_name' => 'required',
		'last_name' => 'required',
        'nickname' => 'required',
		'email' => 'required',
        'password' => 'required',
		'user_level' => 'required',
        'gender' => 'required',
		'last_connection' => 'required',
        'account_status' => 'required',
	];
}