<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;//引入数据库操作类
use app\index\model\Note as NoteModel;

class Note extends Controller
{

	protected $note;
	public function _initialize()
    {
       
        $this->note = new NoteModel();
    }

    public function note_list()
    {
        
        $data = $this->note->getNoteInfo();
       
        $this->assign('data',$data);
        //dump($data);
        //die;
        return $this->fetch();
    }

     public function delNote($id)
     {
        //删除旅游景点

    return Db::table('tr_artcle')->delete(['aid'=>$id]);



    //    $data = $this ->note->delNote(input('id'));
       
    //     if($data){
    //         echo json_encode(1);
    //     }else{
    //         echo json_encode(0);
    //     }
    }
	


}
