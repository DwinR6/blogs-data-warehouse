<?php namespace App\Controllers;
use App\Models\UserModel;

class Home extends BaseController
{

	
	public function index()
	{
		return view('welcome_message');
	}

	public function test()
	{
		$request = \Config\Services::request();
		$saludo = $request->getPost('saludo');
		echo 'Facilito ';
		echo $saludo;
	}

	public function test2()
	{
		$db = db_connect();

		$resultado = $db->query('select * from users');

		echo json_encode ($resultado->getResultArray());

		
	}

	public function insertar()
	{
		$model = new UserModel();
		
		$request = \Config\Services::request();
		$data = [
		"last_name" => $request->getPost('last_name'),
		"first_name" => $request->getPost('first_name'),
		"nickname" => $request->getPost('nickname'),
		"email" => $request->getPost('email'),
		"password" => $request->getPost('password'),
		"user_level" => $request->getPost('user_level'),
		"gender" => $request->GetPost('gender'),
		"last_connection" => $request->GetPost('last_connection'),
		"account_status" => $request->GetPost('account_status'),
		];

		$model->insert($data);
		echo json_encode(["msg"=>"Creado"]);
	}


}
