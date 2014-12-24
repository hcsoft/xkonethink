<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        $this->assign('subwebsite',D('Category')->where( array( 'pid' =>C('XK_SUB_ROOT_CAT')))->select());
        //查询栏目
        $subbannercat = D('Category')->where( array( 'pid' =>C('XK_SUB_BANNER_CAT')))->select();
        $introcat = C("XK_INTRO_CAT");
        foreach($subbannercat as &$cat){
            if($cat['id'] <> $introcat){
                $cat['child'] =  D('Category')->where( array( 'pid' =>$cat['id']))->select();
            }else{
                $cat['child'] =  D('Document')->where( array( 'category_id' =>$cat['id']))->select();
            }
        }
        $this->assign('subbannercat',$subbannercat);

        $toplist =  D('Document')->where( array( 'category_id' =>C('XK_TOP_CAT'),'status'=>array('gt',0)))->select();
        foreach($toplist as &$vo){
            $vo['cover']=get_cover($vo['cover_id']);
        }
//        echo json_encode($toplist);
        $this->assign('toplist',$toplist);
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}

}
