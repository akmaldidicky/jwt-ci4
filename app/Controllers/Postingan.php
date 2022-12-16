<?php

namespace App\Controllers;

use App\Models\PostinganModel;
use App\Models\PostTypeModel;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\RESTful\ResourceController;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class Postingan extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    use ResponseTrait;
    public function index()
    {
        $model = new PostinganModel();

        $key = getenv('TOKEN_SECRET');
        $header = $this->request->getServer('HTTP_AUTHORIZATION');
        $token = explode(' ', $header)[1];

        $decoded = JWT::decode($token, new Key($key, 'HS256'));


        $data = $model->where("user_id",  $decoded->uid)->findAll();
        return $this->setResponseFormat('json')->respond($data);
    }
    public function getId()
    {
        $model = new PostinganModel();

        $key = getenv('TOKEN_SECRET');
        $header = $this->request->getServer('HTTP_AUTHORIZATION');
        $token = explode(' ', $header)[1];

        $decoded = JWT::decode($token, new Key($key, 'HS256'));

        $model->where(['id' => $this->request->getVar('id')]);
        $data = $model->where("user_id",  $decoded->uid)->findAll();
        return $this->setResponseFormat('json')->respond($data);
    }


    public function create()
    {
        $model = new PostinganModel();
        $model2 = new PostTypeModel();
        helper(['form']);
        $rules = [
            'title' => 'required',
            'description' => 'required',
            'post_type' => 'required',

        ];
        if (!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $post_type = $model2->where("jenis",  $this->request->getVar('post_type'))->first();
        if (!$post_type) return json_encode(['massage' => 'post type salah!']);

        $key = getenv('TOKEN_SECRET');
        $header = $this->request->getServer('HTTP_AUTHORIZATION');
        $token = explode(' ', $header)[1];

        $decoded = JWT::decode($token, new Key($key, 'HS256'));

        $data = [
            'user_id'     => $decoded->uid,
            'title'     => $this->request->getVar('title'),
            'description'     => $this->request->getVar('description'),
            'post_type'     => $this->request->getVar('post_type'),
        ];
        $registered = $model->save($data);
        $this->respondCreated($registered);
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function up()
    {
        $model = new PostinganModel();
        $model2 = new PostTypeModel();
        helper(['form']);
        $rules = [
            'id' => 'required',
            'title' => 'required',
            'description' => 'required',
            'post_type' => 'required',

        ];
        if (!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $post_type = $model2->where("jenis",  $this->request->getVar('post_type'))->first();
        if (!$post_type) return json_encode(['massage' => 'post type salah!']);

        $data = [
            'id'     => $this->request->getVar('id'),
            'title'     => $this->request->getVar('title'),
            'description'     => $this->request->getVar('description'),
            'post_type'     => $this->request->getVar('post_type'),
            'updated_at'     => time(),
        ];
        $model->update(['id' => $this->request->getVar('id')], $data);
        return json_encode(['massage' => 'Berhasil update!']);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $model = new PostinganModel();
        $rules = [
            'id' => 'required'

        ];
        if (!$this->validate($rules)) return $this->fail($this->validator->getErrors());
        $id = $this->request->getVar('id');
        $model->delete(['id' => $id]);
        return json_encode(['massage' => 'Data Terhapus!']);
    }
}
